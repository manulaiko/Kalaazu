import Vue from 'vue'
import App from './App'
import router from './router'
import { store } from './store'
import Notifications from 'vue-notification'

Vue.config.productionTip = false
Vue.use(Notifications)

new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
