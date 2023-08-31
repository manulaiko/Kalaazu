/**
 * Account state.
 */
import {AccountState} from "@/store/Account/types";

export const state: AccountState = {
    id: 0,
    sessionId: "",
    name: "",
    levelsId: 0,
    factionsId: 0,
    lastLogin: null,
    experience: 0,
    honor: 0,
    credits: 0,
    uridium: 0,
    jackpot: 0,
};
