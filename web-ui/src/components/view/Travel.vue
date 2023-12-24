<template>
    <List :dataurl="$api.travel" :listType=1></List>
</template>
<script>
import List from '../utils/List.vue'
export default {

    name: 'Travel',
    data() {
        return {
        
        };
    },
    props:{
        userinfo: {
            type: Object,
            required: true,
        },
    },
    methods: {
        

    },
    components:{
        List
    }
}
</script>
<style>

</style>