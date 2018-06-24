<template>
  <v-app>
    <notifications position="top center"/>
    <component v-bind:is="layout"></component>
  </v-app>
</template>

<script>
import AppLayout from './layouts/AppLayout'
import SimpleLayout from './layouts/SimpleLayout'

export default {
  computed: {
    layout() {
      return this.$store.state.layout
    }
  },
  components: {
    'app-layout': AppLayout,
    'simple-layout': SimpleLayout
  }
}
</script>
