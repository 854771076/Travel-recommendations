<template>
    <div class="search-input" >

        <el-input placeholder="关键词" v-model="query.keywords" clearable>
        </el-input>
        <el-button type="primary" @click="search"><el-icon>
                <search />
            </el-icon></el-button>
    </div>
    <div class="block text-center " m="t-4">
        <div class="travel m-hide">
            <div class="bg">
                <el-carousel trigger="click" height="400px">
                    <el-carousel-item v-for="item in imgs" :key="item">

                        <a :href="item.href" target="_blank">
                            <el-image style="width: 100%; height: 100%" :src="item.url" />
                        </a>
                    </el-carousel-item>
                </el-carousel>
            </div>
            <div class="travelType">
                <template v-for="item in $baseData.toplic">
                    <div class="traveltype-item">
                        <a :href="`/travel?topic=${item.code}`"> {{ item.name }}</a>
                        
                    </div>
                </template>
                <template v-for="item in $baseData.topic_code.slice(1, 9)">
                    <div class="traveltype-item">
                        <a :href="`/travel?topic=${item.code}`"> {{ item.name }}</a>
                        
                    </div>
                </template>
                <div class="traveltype-item">
                    <a href="#">更多类型</a>
                    
                </div>
            </div>
        </div>
        <div class="main-carousel">
            <el-carousel trigger="click" height="400px" width="700px">
                <el-carousel-item v-for="item in imgs" :key="item">

                    <a :href="item.href">
                        <el-image style="width: 100%; height: 100%" :src="item.url" />
                    </a>
                </el-carousel-item>
            </el-carousel>

        </div>

    </div>
    <div class="hottravel" style="margin-top: 50px;margin-bottom: 40px;">
        <h1>热门景点</h1>
        <el-menu :default-active="topic" class="el-menu-hottravel" mode="horizontal" :ellipsis="true" @select="getHottravel"
            style="height: 45px">
            <div class="flex-grow" />

            <template v-for="item in $baseData.topic_code.slice(1,)">
                <el-menu-item :index="item.code">
                    {{ item.name }}
                    
                </el-menu-item>


            </template>
        </el-menu>
        <div class="hottravel-items">
            <template v-for="i in 9">
                <div class="hottravel-item-bg" v-show="!hottravelstatus">
                    <el-skeleton :rows="1" />
                    <br />
                    <el-skeleton style="--el-skeleton-circle-size: 24px">
                        <template #template>
                            <el-skeleton-item variant="circle" />
                        </template>
                    </el-skeleton>
                </div>

            </template>
            <template v-for="travel in Hottravel.slice(0,9)">
                <div class="hottravel-item" v-show="hottravelstatus">
                    <div class="card-header">
                        <el-badge value="Hot" class="item">
                            <div class="card-title">
                                <el-tooltip class="box-item" effect="dark" :content="travel.name" placement="bottom">
                                    <a :href="'/travel/detail/'+travel.id">{{ travel.name.slice(0, 10) }}...</a>
                                </el-tooltip>
                                
                            </div>
                        </el-badge>

                        <div class="salary">￥{{ travel.low_price }}起</div>
                    </div>
                    <div class="card-body">
                        <div class="card-info">
                            <span v-if="travel.city">
                            {{ travel.cityTranslation }}&nbsp;
                            </span>
                        </div>
                        <div class="tags">
                            <el-tag class="ml-2" type="info">{{ travel.topicTranslation }}</el-tag>
                        </div>
                    </div>
                    <div class="card-footer">
                        <!-- <div>
                            <el-avatar :size="24" :src="travel.companylogo" alt="" v-if="travel.companylogo"
                                style="margin-right:15px" />
                            <el-tooltip class="box-item" effect="dark" :content="travel.companyname" placement="bottom">
                                <a :href="'/company/detail/'+travel.companyid">{{ travel.companyname.slice(0, 4) }}...</a>
                            </el-tooltip>

                        </div> -->
                        <div>
                            <span v-if="travel.industryname">{{ travel.industryname }}</span><span
                                v-if="travel.companysize">&nbsp;|&nbsp;{{ travel.companysize }}</span>
                            <span v-if="travel.property">&nbsp;|&nbsp;{{ travel.property }}</span>
                        </div>
                    </div>
                </div>

            </template>
        </div>
    </div>
    
</template>
  
<script>
import img1 from '../../assets/imgs/1.jpg'
import img2 from '../../assets/imgs/2.jpg'
import img3 from '../../assets/imgs/3.jpg'
export default {
    name: 'Main',
    async created() {
        this.getHottravel(this.topic)

    },
    props: {
        userinfo: {
            type: Object,
            required: true,
        },

    },
    data() {
        return {
            query: {
                keywords: ''
            },

            imgs: [
                { url: img1, href: 'https://edu.51testing.net/htm/51PC/zlzs.html' },
                { url: img2, href: 'http://zhaopin.chinatowercom.cn/campus' },
                { url: img3, href: 'https://xiaoyuan.zhaopin.com/company/KA0133889514D90000001000' }],
            Hottravel: [],
            hottravelstatus: false,
            HotCompany: [],
            hotcompanystatus: false,
            topic: '1'

        };
    },
    methods: {
        
        search(){
            window.location.href='/travel'+`?keywords=${this.query.keywords}`
        },
        async clicktravel(id){
            let response = await this.$http
                .post(this.$api.clicktravel ,{id:id})
                .then(response => {
                })
                .catch(error => {
                    debagger;
                });
        },
        async getHottravel(code) {
            // let Loading = this.$Loading({ fullscreen: true })
            this.hottraveltatus = false
            let response = await this.$http
                .get(this.$api.travel + `?topic=${code}&ordering=-create_time&page_size=10&pageSize=10`)
                .then(response => {
                    if (response.data.results.length == 0) {
                        this.$Message({ type: 'warning', message: '未查询到数据' })
                    }
                    this.Hottravel = response.data.results
                    this.hottravelstatus = true
                })
                .catch(error => {
                    // Loading.close()
                    this.$Message.error('系统异常,请联系管理员')
                });

        },
       

    },
    components: {

    }
};
</script>
  
<style scoped>

.el-select {
    width: 100px;

}

.el-input__wrapper>* {
    height: 100% !important;
}

.el-input {
    :deep(.el-input__wrapper) {
        border: none !important;
        box-shadow: none !important;
    }

    :deep(.el-input__inner) {
        border: none !important;
        box-shadow: none !important;
    }
}

:deep(.el-input__wrapper) {
    box-shadow: none !important;
    border-radius: 10px;
}

.el-select {
    min-width: 75px !important;

}

.el-button {
    width: 75px;
    border: 0 !important;
    box-shadow: none !important;
    border-radius: 0 10px 10px 0;
    color: none;
}

.el-input__inner {
    border: 0 !important;
    box-shadow: none;
    background-color: none;
}

.travelType {
    height: 400px;
    width: 250px;
    background: rgba(79, 90, 102, .6);
    -webkit-backdrop-filter: blur(35px);
    backdrop-filter: blur(35px);
    z-index: 100;
    position: relative;
    top: -400px;
    padding: 10px 0;
}
.text-center{
    max-height: 400px;
}
.traveltype-item {
    height: 42px;
    padding-left: 24px;
    padding-right: 16px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    cursor: pointer;


}

.traveltype-item a {
    line-height: 42px;
    color: white;
    font-size: 14px;
    font-family: PingFangSC-Medium, PingFang SC;
    font-weight: 500;
    text-decoration: none;
}

.search-input {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    margin-bottom: 15px;
    border: 1px var(--el-menu-border-color) solid;
    border-radius: 10px;
    background-color: white;
}

.traveltype-item:hover {
    background-color: rgba(0, 0, 0, 0.3);
}

.traveltype-item:hover .sub-items {
    display: block;
}

.sub-items-content {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    flex-wrap: wrap;

}

.sub-items-content a {
    color: gray !important;
}

.sub-items h3 {
    margin-bottom: 15px;
}

.sub-items-content a {
    margin-right: 15px;
}

.text-center {
    display: flex;
    flex-direction: row;
}

.main-carousel {
    /* width: 900px; */
    flex: 1;
    position: relative;
}

.bg {
    width: 100%;
    /* height: 400px; */
}

.el-input__wrapper {
    padding: 0 !important;

}

.el-carousel__item h3 {
    color: #475669;
    opacity: 0.75;
    line-height: 150px;
    margin: 0;
    text-align: center;
}

.el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
}
</style>
  