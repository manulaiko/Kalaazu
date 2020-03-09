import Vue from "vue";
import VueRouter from "vue-router";
import External from "@/views/External.vue";
import Login from "@/components/external/Login.vue";
import Register from "@/components/external/Register.vue";
import CompanyChoose from "@/views/CompanyChoose.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "external",
    component: External,
    children: [
      { path: "register", name: "register", component: Register },
      { path: "", name: "login", component: Login }
    ]
  },
  {
    path: "/CompanyChoose",
    name: "companyChoose",
    component: CompanyChoose
  }
];

const router = new VueRouter({
  routes
});

export default router;
