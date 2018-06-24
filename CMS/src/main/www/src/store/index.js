'use strict'

import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    layout: 'simple-layout',
    user: null,
    notifications: []
  },
  mutations: {
    SET_LAYOUT(state, payload) {
      state.layout = payload
    },
    SET_USER(state, payload) {
      state.user = payload
    },
    ADD_NOTIFICATION(state, payload) {
      state.notifications.push(payload)
    }
  }
})
