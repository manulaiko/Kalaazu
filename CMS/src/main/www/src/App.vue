<template>
  <router-view></router-view>
</template>

<script lang="ts">
export default {
  name: "app"
};
</script>

<style lang="sass">
body
background-image:

url
(
"/images/bg.jpg"
)
background-size: cover
color: whitesmoke
overflow: auto
&::-webkit-scrollbar
display: none
a
color: whitesmoke

!important

&:hover
background-color:

rgba
(
0
,
0
,
0
,
0.25
)
!important
</style>
