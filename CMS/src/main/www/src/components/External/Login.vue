<template>
  <div id="form-login">
    <div class="field">
      <p class="control has-icons-left">
        <input class="input" type="text" placeholder="Username" v-model="username">
        <span class="icon is-small is-left">
          <i class="fas fa-user"></i>
        </span>
      </p>
    </div>
    <div class="field">
      <p class="control has-icons-left">
        <input class="input" type="password" placeholder="Password" v-model="password">
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
      execute: function () {
        this.$set(this.$data, 'submit', 'Logging in...');

        const data = {
          username: this.username,
          password: this.password
        };
        /*this.$eventBus.send('persistence.login', data, (err, res) => {
          this.$set(this.$data, 'submit', 'Login');

          if (err != null) {
            this.$notify({
              type: 'error',
              text: err.failureType + ' (' + err.failureCode + '): ' + err.message
            });

            return;
          }

          if (res.body.isError) {
            this.$notify({
              type: 'error',
              text: res.body.message
            });

            return;
          }

          this.$store.state.sessionId = res.body.sessionId;
          this.$router.push('/Internal/Start');
        });*/
        this.$store.state.sessionId = "0";
        this.$router.push('/Internal/Start');
      }
    }
  }
</script>
