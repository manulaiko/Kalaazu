<template>
    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered is-centered">
                <div class="columns is-centered">
                    <div class="column is-one-third content">
                        <h1 class="title">
                            Kalaazu
                        </h1>
                        <h2 class="subtitle">
                            Conquer yo mamma
                        </h2>
                        <div class="tabs is-centered " id="nav">
                            <ul>
                                <li :class="{'is-active': active == 'login'}"><a @click.prevent="open('login')">Login</a></li>
                                <li :class="{'is-active': active == 'register'}"><a @click.prevent="open('register')">Register</a></li>
                            </ul>
                        </div>
                        <div id="form">
                          <div :is="active"></div>
                        </div>
                        <p class="help">
                            By login in or registering, you confirm that you've read and accept the Terms & Conditions
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import ExternalLogin from './Login'
import ExternalRegister from './Register'

export default {
  data() {
    return {
      active: 'login'
    }
  },
  components: {
    login: ExternalLogin,
    register: ExternalRegister
  },
  methods: {
    /**
     * Toggles the form to show.
     *
     * @param string which Which form should be shown.
     */
    open: function(which) {
      this.active = which
    }
  }
}
</script>
