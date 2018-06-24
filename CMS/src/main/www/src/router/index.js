import Vue from 'vue'
import Router from 'vue-router'
import { store } from '@/store'
import NotFound from '@/components/NotFound'
import External from '@/components/External'

Vue.use(Router)

function redirectInternal(to, from, next) {
  if (store.state.user != null) {
    next("/Internal/Start")
  }

  next()
}

function redirectExternal(to, from, next) {
  if (store.state.user == null) {
    next("/External")
  }

  next()
}

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      beforeEnter: redirectExternal
    },
    {
      path: '/External',
      component: External,
      beforeEnter: redirectInternal
    },
    {
      path: '*',
      component: NotFound
    }
  ]
})
