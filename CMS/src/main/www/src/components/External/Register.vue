<template>
    <div id="form-register">
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
            <p class="control has-icons-left">
                <input class="input" entity="email" placeholder="Email" v-model="email">
                <span class="icon is-small is-left">
                    <i class="fas fa-envelope"></i>
                </span>
            </p>
        </div>
        <div class="field">
            <p class="control has-icons-left">
                <input class="input" entity="text" placeholder="Invitation code" v-model="code">
                <span class="icon is-small is-left">
                    <i class="fas fa-barcode"></i>
                </span>
            </p>
        </div>
        <div class="field control">
            <label class="label">Faction</label>
            <div class="select is-fullwidth">
                <select v-model="faction">
                    <option value="1" selected>MMO</option>
                    <option value="2">EIC</option>
                    <option value="3">VRU</option>
                </select>
            </div>
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
      submit: 'Register',

      username: '',
      password: '',
      email: '',
      code: '',
      faction: '1'
    }
  },
  methods: {
    /**
     * Submits the form.
     */
    execute: function() {
      this.$set(this.$data, 'submit', 'Registering...')

      axios.get('http://localhost/External/register.php', {
        params: {
          username: this.username,
          password: this.password,
          email: this.email,
          code: this.code,
          faction: this.faction
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
      });

      this.$set(this.$data, 'submit', 'Register')
    }
  }
}
</script>
