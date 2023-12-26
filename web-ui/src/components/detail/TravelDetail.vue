<template>
    <Snav>
        <template v-slot:name>景点详细</template>
    </Snav>
    <div
        style="width:100%;background-color:rgba(255, 255, 255, 0.726);box-shadow:0 3px 10px 0 rgba(0,0,0,.12);margin-bottom: 20px;padding-top: 45px;">
        <div class="info">
            <div class="baseinfo">
                <el-tooltip class="box-item" effect="dark" :content="travelinfo.name" placement="bottom">
                    <h1 class="name">{{ travelinfo.name.length <= 9 ? travelinfo.name : travelinfo.name.slice(0, 9) + '...' }} </h1>
                </el-tooltip>

                <p style="font-size: 15px">
                    <span v-if="travelinfo.workcity" style="margin-right: 15px;"><el-icon style="vertical-align: middle;">
                            <Location />
                        </el-icon>{{ travelinfo.workcity }}</span>
                    <span v-if="travelinfo.workingexp" style="margin-right: 15px;"><el-icon style="vertical-align: middle;">
                            <Suitcase />
                        </el-icon> {{ travelinfo.workingexp }}</span>
                    <span v-if="travelinfo.education"><el-icon style="vertical-align: middle;">
                            <Reading />
                        </el-icon>{{ travelinfo.education }}</span>

                </p>
                <p class="price">{{ travelinfo.salary60 }}</p>

            </div>
            <div class="tag">

                <el-tag class="ml-2" size="large">{{ travelinfo.cityTranslation }}</el-tag>
                <el-tag class="ml-2" size="large" v-if="travelinfo.topicTranslation">{{ travelinfo.topicTranslation }}</el-tag>
                <div class="btn">

                    <el-button type="info" disabled><el-icon>

                            <View />
                        </el-icon>{{ viewer }}浏览</el-button>
                    <el-button type="success"><a :href="travelinfo.url" style="color: white;">购票</a></el-button>
                    <el-button type="warning" v-if="!iscollected" @click="Collected(travelinfo.id)"><el-icon style="vertical-align: middle;"
                            >
                            <StarFilled />
                        </el-icon>收藏</el-button>
                    <el-button type="warning" v-if="iscollected" @click="removeCollected(travelinfo.id)"><el-icon style="color: yellow;vertical-align: middle;"
                            >
                            <StarFilled />
                        </el-icon> 已收藏</el-button>

                </div>
            </div>
        </div>
    </div>

    <div class="main">
        <div class="travel-detail">
            <div class="travel-detail-section">
              <h2>图片：</h2>
              <el-image style="width: 250px; height: 250px;display: flex;align-items: center;justify-content: center;border-radius: 15px;margin-bottom: 10px;"
                            :src="travelinfo.img" alt="" />
              <h2>地址：</h2>
              {{travelinfo.address  }}
              <Comment :id="id"></Comment>
            </div>
            
        </div>
        <div class="sider">
            
            <div>
                <p class="title">相似景点</p>
                <template v-for="travel in similartravel" v-if="similartravel.length!=0">
                    <div class="simlarytravel">
                        <div class="simlarytravelinfo">
                            <el-tooltip class="box-item" effect="dark" :content="travel.name" placement="bottom">
                                <a :href="'/travel/detail/' + travel.id">

                                    {{ travel.name.length <= 9 ? travel.name : travel.name.slice(0, 9) + '...' }} </a>
                            </el-tooltip>

                            <div class="salary">
                                ￥{{ travel.low_price }}起
                            </div>
                        </div>
                        
                    </div>
                </template>
                <template v-else>
                    <div class="simlarytravel">
                        <div class="simlarytravelinfo">
                            <el-empty description="description" />
                        </div>
                        
                    </div>
                </template>
            </div>
        </div>
    </div>
</template>
<script>
import Snav from '../utils/Snav.vue'
import Comment from '../detail/Comment.vue'

export default {

    name: 'TravelDetail',
    created() {
        const id = this.$route.params.id;
        this.id=id
        console.log(this.$route.params.id)
        this.gettravelInfo(id)
        this.getsimilartravel(id)
        this.clicktravel(id)
        this.isCollected(id)
    },
    data() {
        return {
            travelinfo: {
                name: '',
                companyname: ''
            },
            similartravel: [],
            iscollected: false,
            viewer: 0
        };
    },

    methods: {
        async removeCollected(id) {
            let response = await this.$http
                .post(this.$api.removecollect, { id: id })
                .then(response => {
                    if(response.data.code==200){
                        this.iscollected = false
                    }else{
                        this.$Message({type:'warning',message:response.data.msg})
                    }
                    
                })
                .catch(error => {
                    this.$Message({type:'warning',message:'系统异常'})
                });
        },
        async Collected(id) {
            let response = await this.$http
                .post(this.$api.collect, { id: id })
                .then(response => {
                    if(response.data.code==200){
                        this.iscollected = true
                    }else{
                        this.$Message({type:'warning',message:response.data.msg})
                    }
                })
                .catch(error => {
                });
        },
        async isCollected(id) {
            let response = await this.$http
                .post(this.$api.iscollected, { id: id })
                .then(response => {
                    this.iscollected = response.data.data
                    
                })
                .catch(error => {
                });
        },
        async clicktravel(id) {
            let response = await this.$http
                .post(this.$api.click, { id: id })
                .then(response => {
                    this.viewer = response.data.data.sum?response.data.data.sum:0
                })
                .catch(error => {
                });
        },
        async gettravelInfo(id) {
            let Loading = this.$Loading({ fullscreen: true })
            let response = await this.$http
                .get(this.$api.travel + id + '/')
                .then(response => {
                    this.travelinfo = response.data
                    console.log(response.data)
                    Loading.close()
                })
                .catch(error => {
                    Loading.close()
                    this.$Message.error('未查询到数据')
                });

        }
        ,
        async getsimilartravel(id) {
            let response = await this.$http
                .get(this.$api.similartravel + id + '/')
                .then(response => {
                    this.similartravel = response.data.results
                })
                .catch(error => {
                    // this.$Message.error('未查询到数据')
                });

        }
    },
    components: {
        Snav,
        Comment
    }
}
</script>
<style scoped>
.simlarytravelinfo {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.simlarytravelinfo a {
    font-size: 18px;
}

.simlarytravelinfo:hover a {
    color: orange;
}

.simlarycompanyinfo {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 20px;
    line-height: 24px;
}

.simlarycompanyinfo>div {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    line-height: 24px;
}

.simlarycompanyinfo:hover a {
    color: orange;
}

.simlarytravel:hover {
    background: rgba(0, 0, 0, 0.1);
}

.simlarytravel {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    line-height: 26px;
    color: #414a60;
    font-size: 14px;
    margin: 0;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    list-style: none;
    border-radius: 8px;
    padding: 12px 16px;
    transition: all .2s linear;
}

.travel-detail-company-logo_custompage {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    font-size: 16px;
    font-weight: 500;
    line-height: 22px;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    color: #414a60;
    float: left;
    width: 48px;
    height: 48px;
    margin-right: 16px;
    border: 1px solid #f3f5fb;
    border-radius: 8px;
}

.travel-detail-company_custompage {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    font-size: 16px;
    font-weight: 500;
    line-height: 22px;
    padding: 0;
    margin: 0;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    text-decoration: none;
    color: #414a60;
}

.company-info {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    margin: 0;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    overflow: hidden;
    display: flex;
    align-items: center;
    padding: 16px 24px;
    margin-bottom: 4px;
    font-size: 16px;
    font-weight: 500;
    color: #222;
    line-height: 22px;
}

.main {
    display: flex;
    flex-direction: row;
}

.name {
    text-align: left;
}

.title {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    margin: 0;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    display: flex;
    align-items: center;
    font-size: 16px;
    font-weight: 500;
    color: #222;
    line-height: 22px;
    padding: 12px 24px;
    background: linear-gradient(90deg, #f5fcfc 0, #fcfbfa 100%);
    margin-bottom: 0;
    border-radius: 12px 12px 0 0;
}

.sider>div {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    line-height: 26px;
    color: #414a60;
    font-size: 14px;
    padding: 0;
    margin: 0;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    border-radius: 12px;
    padding-bottom: 20px;
    background: #fff;
    margin-bottom: 16px;
}

.travel-detail-tags {
    margin-top: 15px;

}

.travel-detail-tags>* {
    margin-right: 15px;
    margin-top: 15px;
}

.travel-detail-section {
    font-family: arial, verdana, helvetica, 'PingFang SC', 'HanHei SC', STHeitiSC-Light, Microsoft Yahei, sans-serif;
    -webkit-font-smoothing: antialiased;
    line-height: 26px;
    color: #414a60;
    font-size: 14px;
    margin: 0;
    -webkit-tap-highlight-color: transparent;
    -webkit-text-size-adjust: none;
    background: #fff;
    border-radius: 12px;
    padding: 20px 30px;
}
h2{
    margin-bottom: 10px;
}
.info {
    padding: 20px 10px;
    height: 215px;
    top: 0;
    max-width: 1200px;
    width: 100%;
    margin: 0 auto;
    display: flex;
    justify-content: space-between
}

.price {
    font-size: 20px;
    padding: 10px 0;
}

.baseinfo {
    min-width: 300px;
}

.tag {
    width: 300px;
    position: relative;
    padding-bottom: 20px;
    white-space: nowrap;
    /* 禁止文本换行 */
    overflow: hidden;
    /* 超出部分隐藏 */
    text-overflow: ellipsis;

}

.tag>* {
    margin-right: 15px;
}

.btn {
    position: absolute;
    bottom: 15px;
    left: 0
}

.travel-detail {
    flex: 1;
    margin: 0 10px;
}

.sider {
    width: 280px;
    margin: 0 10px !important;
}

@media screen and (max-width: 568px) {
    .info {
        flex-direction: column;
        padding: 0 15px;
    }

    .tag {
        flex: 1
    }

    .name {
        text-align: center !important;
    }

    .main {
        flex-direction: column;
    }

    .sider {
        flex: 1;
        width: unset;
    }

    
}
</style>