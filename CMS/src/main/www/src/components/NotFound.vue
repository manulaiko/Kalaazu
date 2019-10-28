<template>
    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered is-centered">
                <div class="columns is-centered">
                    <div class="column is-one-third content">
                        <h1 class="title">
                            Not found
                        </h1>
                        <h2 class="subtitle">
                          You just got 404'ed
                        </h2>
                      <a class="button is-info is-inverted is-outlined"
                         @click.prevent="$router.push('/External')">Home</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
}
</script>
