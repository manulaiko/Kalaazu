import Vue from 'vue'
import Router from 'vue-router'
import { store } from '@/store'
import NotFound from '@/components/NotFound'
import External from '@/components/External'

Vue.use(Router)

function redirectExternal(to, from, next) {
  if (store.state.sessionId == null) {
    next("/External")
  }

  next()
}

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      beforeEnter(to, from, next) {
        if (store.state.sessionId == null) {
          next("/External")
        } else {
          nex("/Internal")
        }
      }
    },
    {
      path: '/External',
      component: External,
      beforeEnter(to, from, next) {
        if (store.state.sessionId != null) {
          next("/Internal/Start")
        }

        next()
      }
    },
    {
      path: '*',
      component: NotFound
    }
  ]
})
