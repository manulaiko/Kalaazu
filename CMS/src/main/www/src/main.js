import Vue from 'vue'
import App from './App'
import router from './router'
import {store} from './store'
import Notifications from 'vue-notification'
import VModal from 'vue-js-modal'

Vue.config.productionTip = false;
Vue.use(Notifications);
Vue.use(VModal, {dialog: true});

new Vue({
  el: '#app',
  router,
  store,
  components: {App},
  template: '<App/>'
});
