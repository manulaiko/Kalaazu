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
                <input class="input" entity="password" placeholder="Password" v-model="password">
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
import axios from 'axios'

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
      this.$set(this.$data, 'submit', 'Logging in...')

      axios.get('http://localhost/External/login.php', {
        params: {
          username: this.username,
          password: this.password
        }
      }).then(r => {
        if(r.data.isError) {
          this.$notify({
            type: 'error',
            text: r.data.message
          })
        } else {
          this.$store.state.sessionId = r.data.sessionId
          this.$router.push('/Internal/Start')
        }

        this.$set(this.$data, 'submit', 'Login')
      });
    }
  }
}
</script>
