<template>
  <section class="hero is-fullheight">
    <div class="hero-head">
      <b-navbar>
        <template slot="end">
          <router-link :to="{ name: 'login' }" tag="b-navbar-item">
            Login
          </router-link>

          <router-link :to="{ name: 'register' }" tag="b-navbar-item">
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
