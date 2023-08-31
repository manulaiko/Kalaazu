import Vue from "vue";
import Vuex from "vuex";
import {account} from "@/store/Account";
import {RootState} from "@/store/types";

Vue.use(Vuex);

export default new Vuex.Store<RootState>({
    state: {
        isLoggedIn: false
    },
    mutations: {
        ISLOGGEDIN: (state, payload) => {
            state.isLoggedIn = payload;
        }
    },
    actions: {
        /**
         * Performs the login state.
         */
        LOGIN: (context, payload) => {
            context.commit("ISLOGGEDIN", true);
            context.dispatch("INIT_ACCOUNT", payload);
        }
    },
    modules: {
        account: account
    }
});
