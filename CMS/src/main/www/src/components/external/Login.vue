<template>
  <section class="column is-4 is-offset-4">
    <h3 class="title">Login</h3>
    <hr class="login-hr"/>
    <form>
      <b-field label="Username">
        <b-input v-model="username"></b-input>
      </b-field>

      <b-field label="Password">
        <b-input v-model="password" password-reveal type="password"></b-input>
      </b-field>

      <b-button expanded type="is-primary" @click="login">
        Login
      </b-button>
    </form>
  </section>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    /**
     * Performs the login operation.
     */
    login: function () {
      this.$api.external.login(this.username, this.password);
    }
  }
};
</script>

<style lang="sass" scoped>
section
background-color:
rgba

(
255
,
255
,
255
,
0.5
)
border-radius:

10
px
padding:

25
px
label
color: black
</style>
