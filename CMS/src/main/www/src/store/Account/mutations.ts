import {MutationTree} from "vuex";
import {AccountState} from "@/store/Account/types";

/**
 * Account store mutations.
 */
export const mutations: MutationTree<AccountState> = {
  SET_ACCOUNT: (state, payload) => {
    state = payload
  }
};