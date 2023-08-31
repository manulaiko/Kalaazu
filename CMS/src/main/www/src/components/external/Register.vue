<template>
  <section class="column is-4 is-offset-4">
    <h3 class="title">Register</h3>
    <hr class="login-hr"/>
    <form>
      <b-field label="Username">
        <b-input v-model="username"></b-input>
      </b-field>

      <b-field label="Password">
        <b-input v-model="password" password-reveal type="password"></b-input>
      </b-field>

      <b-field label="Email">
        <b-input v-model="email" type="email"></b-input>
      </b-field>

      <b-button expanded type="is-primary" @click="register">
        Register
      </b-button>
    </form>
  </section>
</template>

<script>
export default {
  name: "Register",
  data() {
    return {
      username: "",
      password: "",
      email: ""
    };
  },
  methods: {
    /**
     * Performs the register operation.
     */
    register: function () {
      this.$api.external.register(this.username, this.password, this.email);
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
