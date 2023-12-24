<template>
    <el-page-header @back="goBack" class="back" style="background-color: white;position: fixed;
  z-index: 1000;
  width: 100%;">
        <template #title>
            返回
        </template>
        <template #content>
            <span class="text-large font-600 mr-3">
                <slot name="name"></slot>
            </span>
        </template>
    </el-page-header>
</template>
<script>
export default {

    name: 'Snav',
    data() {
        return {

        };
    },
    created(){
        
    },
    methods: {
        goBack() {
            const arr=document.referrer.split('/').slice(3,)
            const referrer = '/'+arr.join('/');
            const currentPage = this.$route.query.page || 1;
            console.log(referrer)
            if((arr.indexOf('travel')!=-1||arr.indexOf('recommend')!=-1)&&arr.length<2){
                this.$router.push({
                path: referrer,
                query: {
                    page: currentPage  // 将当前的页码作为 query 参数传递
                }
                });
            }else{
                this.$router.back()
            }
            
        }
    },
}
</script>
<style >
.back {
    height: 45px;
    border-bottom: solid 1px var(--el-menu-border-color);
    box-shadow: 0 3px 10px 0 rgba(0, 0, 0, .12);

}

.el-page-header__back {
    padding-left: 10px;
}

.el-page-header__header {
    line-height: 45px !important;
}</style>