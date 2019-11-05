import {ActionTree} from "vuex";
import {AccountState} from "@/store/Account/types";
import {RootState} from "@/store/types";
import router from "@/router";

/**
 * Account actions.
 */
export const actions: ActionTree<AccountState, RootState> = {
  INIT_ACCOUNT: (context, payload) => {
    if(payload.factionsId == undefined || payload.factionsId < 1) {
      router.push({ name: 'companyChoose' });

      return;
    }

    context.commit('SET_ACCOUNT', payload)
  }
};
