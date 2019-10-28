<template>
  <div id="form-register">
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
      <p class="control has-icons-left">
        <input class="input" type="email" placeholder="Email" v-model="email">
        <span class="icon is-small is-left">
          <i class="fas fa-envelope"></i>
        </span>
      </p>
    </div>
    <div class="field">
      <p class="control has-icons-left">
        <input class="input" type="text" placeholder="Invitation code" v-model="code">
        <span class="icon is-small is-left">
          <i class="fas fa-barcode"></i>
        </span>
      </p>
    </div>
    <div class="field control">
      <label class="label" for="faction">Faction</label>
      <div class="select is-fullwidth">
        <select v-model="faction" id="faction">
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
      execute: function () {
        this.$set(this.$data, 'submit', 'Registering...');

        const data = {
          username: this.username,
          password: this.password,
          email: this.email,
          invitationCode: this.code,
          factionsId: this.faction,
          ip: '0.0.0.0'
        };
        this.$eventBus.send('persistence.register', data, (err, res) => {
          this.$set(this.$data, 'submit', 'Register');

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
        });
      }
    }
  }
</script>
