import {ApiResponse} from "@/service/api/types";
import {AccountState} from "@/store/Account/types";

/**
 * Login/Register endpoint response.
 */
export type Result = ApiResponse<{
    account: AccountState;
}>;
