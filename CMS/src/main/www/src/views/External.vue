<template>
  <section class="hero is-fullheight">
    <div class="hero-head">
      <b-navbar>
        <template slot="end">
          <router-link tag="b-navbar-item" to="login">
            Login
          </router-link>

          <router-link tag="b-navbar-item" to="register">
            Register
          </router-link>
        </template>
      </b-navbar>
    </div>

    <div class="hero-body">
      <div class="container has-text-centered">
        <router-view></router-view>
      </div>
    </div>

    <div class="hero-foot"></div>
  </section>
</template>

<script>
export default {
  name: "external"
};
</script>
