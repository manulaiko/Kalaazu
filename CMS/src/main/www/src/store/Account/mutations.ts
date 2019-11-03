import {MutationTree} from "vuex";
import {AccountState} from "@/store/Account/types";

/**
 * Account mutations.
 */
export const mutations: MutationTree<AccountState> = {
    INIT_ACCOUNT: (state, payload) => {
        state = payload;
    }
};