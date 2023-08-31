import {Module} from "vuex";
import {RootState} from "@/store/types";
import {AccountState} from "@/store/Account/types";
import {state} from "@/store/Account/state";
import {actions} from "@/store/Account/actions";
import {mutations} from "@/store/Account/mutations";

/**
 * Account store module.
 * =====================
 *
 * Store module handling account state.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
export const account: Module<AccountState, RootState> = {
    state: state,
    actions: actions,
    mutations: mutations
};
