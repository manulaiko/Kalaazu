<template>
    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered is-centered">
                <div class="columns is-centered">
                    <div class="column is-one-third content">
                        <h1 class="title">
                            Not found
                        </h1>
                        <h2 class="subtitle">
                          You just got 404'ed
                        </h2>
                        <a class="button is-info is-inverted is-outlined" @click.prevent="goHome()">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { store } from '@/store'

store.commit('SET_LAYOUT', (store.state.user != null) ? 'app-layout' : 'simple-layout')

export default {
  methods: {
    goHome() {
      this.$router.push('/')
    }
  }
}
</script>
