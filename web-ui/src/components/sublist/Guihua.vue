<template>
    <Snav>
        <template v-slot:name>推荐旅游规划</template>
    </Snav>

    <el-main class="main">
        <List :dataurl="$api.guihua" :listType="0" ></List>
    </el-main>
    
</template>
<script>
import List from '../utils/List.vue'
import Snav from '../utils/Snav.vue'
export default {

    name: 'Guihua',
    data() {
        return {
        
        };
    },
    
    methods: {
        

    },
    components:{
        List,
        Snav 
    }
}
</script>
<style>

</style>