<template>
  <section class="column is-4 is-offset-4">
    <h3 class="title">Register</h3>
    <hr class="login-hr" />
    <form>
      <b-field label="Username">
        <b-input v-model="username"></b-input>
      </b-field>

      <b-field label="Password">
        <b-input type="password" password-reveal v-model="password"></b-input>
      </b-field>

      <b-field label="Email">
        <b-input type="email" v-model="email"></b-input>
      </b-field>

      <b-button type="is-primary" expanded @click="register">
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
    register: function() {
      this.$api.external.register(this.username, this.password, this.email);
    }
  }
};
</script>

<style lang="sass" scoped>
section
  background-color: rgba(255, 255, 255, 0.5)
  border-radius: 10px
  padding: 25px

  label
    color: black
</style>
