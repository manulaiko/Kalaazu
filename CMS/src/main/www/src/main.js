import Vue from 'vue'
import App from './App'
import router from './router'
import {store} from './store'
import Notifications from 'vue-notification'
import VertxEventBus from 'vue-vertx3-eventbus-client'

Vue.config.productionTip = false;
Vue.use(Notifications);
Vue.use(VertxEventBus, {path: '/eventbus', port: 8080});

new Vue({
  el: '#app',
  router,
  store,
  components: {App},
  template: '<App/>'
});
