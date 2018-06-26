import Vue from 'vue'
import Router from 'vue-router'
import { store } from '@/store'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      beforeEnter(to, from, next) {
        if (store.state.sessionId == null) {
          next("/External")
        } else {
          next("/Internal")
        }
      }
    },
    {
      path: '/External',
      component: () => import('@/components/External'),
      beforeEnter(to, from, next) {
        if (store.state.sessionId != null) {
          next("/Internal/Start")
        }

        next()
      }
    },
    {
      path: '/Internal',
      component: () => import('@/components/Internal'),
      beforeEnter(to, from, next) {
        if (store.state.sessionId == null) {
          next('/External')
        }

        next()
      },
      children: [
        { path: '', beforeEnter(to, from, next) { next('Start') } },
        { path: 'Start', component: () => import('@/components/Internal/Start') },
        { path: '*', component: () => import('@/components/NotFound') }
      ]
    },
    { path: '*', component: () => import('@/components/NotFound') }
  ]
})
