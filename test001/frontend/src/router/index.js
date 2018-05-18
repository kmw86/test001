import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import HelloWorld2 from '@/components/HelloWorld2'
import Test01 from '@/components/Test01'
import Test02 from '@/components/Test02'
import LoginForm from '@/components/LoginForm'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/login',
      name: 'LoginForm',
      component: LoginForm
    },
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
     {
      path: '/2',
      name: 'HelloWorld2',
      component: HelloWorld2,
      children:[
          {
            path: '01',
            name: 'Test01',
            component: Test01,
          },
          {
            path: '02',
            name: 'Test02',
            component: Test02
          }
      ] 
    },
    {
      path: '/3',
      name: 'Test02',
      component: Test02
    }
  ]
})
