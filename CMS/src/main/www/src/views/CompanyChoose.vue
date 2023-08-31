<template>
  <section class="hero is-fullheight">
    <div class="hero-body">
      <div class="container has-text-centered">
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "companyChoose",
  data: function () {
    return {
      companies: []
    }
  },
  created: function () {
    this.companies = this.$api.companies.list();
  }
};
</script>
