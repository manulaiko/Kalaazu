<template>
    <div id="form-login">
        <div class="field">
            <p class="control has-icons-left">
                <input class="input" entity="text" placeholder="Username" v-model="username">
                <span class="icon is-small is-left">
                    <i class="fas fa-user"></i>
                </span>
            </p>
        </div>
        <div class="field">
            <p class="control has-icons-left">
                <input class="input" entity="password" placeholder="Password" v-model="username">
                <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                </span>
            </p>
        </div>
        <div class="field">
            <input type="submit" class="button is-info is-inverted is-outlined" @click.prevent="execute()" v-model="submit">
        </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      submit: 'Login',

      username: '',
      password: ''
    }
  },
  methods: {
    /**
     * Submits the form.
     */
    execute: function() {
      /* var data = new FormData()
      data.set('username', this.login_username)
      data.set('password', this.login_password)

      var request = new Request('/External/login')

      this.$set(this.$data, 'login_submit', 'Logging in...')

      execute(request, {
        method: 'GET',
        body: data,
        cache: 'no-cache'
      }, '/Internal/Start') */
    }
  }
}
</script>
