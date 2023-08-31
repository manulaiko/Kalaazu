import Vue from "vue";
import Buefy from "buefy";
import "buefy/dist/buefy.css";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import api from "@/service/api";

Vue.config.productionTip = false;
Vue.use(Buefy);
Vue.use(api, {
    url: "http://localhost:8080"
});

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount("#app");
