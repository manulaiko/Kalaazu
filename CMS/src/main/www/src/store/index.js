'use strict'

import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    layout: 'simple-layout',
    sessionId: null
  },
  mutations: {
    SET_LAYOUT(state, payload) {
      state.layout = payload
    },
    SET_SESSIONID(state, payload) {
      state.sessionId = payload
    }
  }
})
