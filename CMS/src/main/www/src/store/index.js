'use strict'

import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    sessionId: null
  },
  mutations: {
    SET_SESSIONID(state, payload) {
      state.sessionId = payload
    }
  }
})
