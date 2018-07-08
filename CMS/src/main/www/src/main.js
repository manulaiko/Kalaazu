import Vue from 'vue'
import App from './App'
import router from './router'
import {store} from './store'
import Notifications from 'vue-notification'
import VertxEventBus from 'vue-vertx3-eventbus-client'
import VModal from 'vue-js-modal'

Vue.config.productionTip = false;
Vue.use(Notifications);
Vue.use(VertxEventBus, {path: '/eventbus', port: 8080});
Vue.use(VModal, {dialog: true});

new Vue({
  el: '#app',
  router,
  store,
  components: {App},
  template: '<App/>'
});
