import { createRouter, createWebHistory  } from 'vue-router'

import Home from './components/Home.vue'
import  Login  from './components/user/Login.vue'
import Resume from './components/user/Resume.vue'
import TravelDetail from './components/detail/TravelDetail.vue'
import Stars from './components/sublist/Stars.vue'
import Guihua from './components/sublist/Guihua.vue'

import History from './components/sublist/History.vue'

// 创建路由对象
const router = createRouter({
  history: createWebHistory (),
  routes: [
    { path: '/', name:'首页',component: Home },
    { path: '/recommend', name:'推荐',component: Home },
    { path: '/Travel', name:'职位',component: Home },
    { path: '/mine', name:'我的',component: Home },
    { path: '/login', name:'登录',component: Login },
    { path: '/resume', name:'喜好',component: Resume },
    { path: '/star', name:'收藏',component: Stars },
    { path: '/guihua', name:'规划',component:Guihua},

    { path: '/history', name:'浏览',component: History },
    { path: '/Travel/detail/:id', name:'景区详细',component: TravelDetail  },
  ],
})

// 全局路由导航守卫
router.beforeEach((to, from, next) => {
const accessToken = localStorage.getItem('accessToken')
  if ((to.path ==='/mine' ) && !accessToken) {
    // 证明用户要访问后台主页
    next('/login')
  } else {
    // 访问的不是后台主页
    next()
  }
})

export default router
