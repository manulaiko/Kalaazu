<template>
  <div id="app">
    <nav class="content navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a href="Internal/Start" class="navbar-item">
          Start
        </a>

        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>
      <div class="navbar-menu">
        <div class="navbar-start">
          <carousel :auto="3000" :watch-items="news" :loop="true" class="navbar-item" >
            <carousel-item v-for="(item, index) in news">
              <a class="navbar-item" @click.prevent="showNews(item)">{{item.title}}</a>
            </carousel-item>
          </carousel>
        </div>
        <div class="navbar-end">
          <div class="navbar-item has-dropdown is-hoverable">
            <a href="#" class="navbar-link">
              <span class="fa fa-envelope"></span>
              <small class="circle-warning top-right">1</small>
            </a>
            <div class="navbar-dropdown">
              <div class="navbar-item">
                <h4><a href="Internal/Messages/1">New message</a></h4>
              </div>
            </div>
          </div>
          <div class="navbar-item has-dropdown is-hoverable">
            <a href="#" class="navbar-link">
                test
            </a>
            <div class="navbar-dropdown">
              <div class="block block-drop-shadow">
                <div class="head np">
                  <div class="user">
                    <div class="info">
                      <img src="img/logob.png" class="img-circle img-thumbnail">
                      <a href="#" class="informer informer-one">
                        <span>10002000</span> Experience
                      </a>
                      <a href="#" class="informer informer-two">
                        <span>20000</span> Honor
                      </a>
                      <a href="#" class="informer informer-three">
                        <span>1000000</span> Credits
                      </a>
                      <a href="#" class="informer informer-four">
                        <span>1000</span> Uridium
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="block block-drop-shadow page-navigation-hide">
                <div class="head bg-dot20">
                  <div class="side pull-left">
                    <div class="head-panel nm">
                      <div class="hp-info hp-simple pull-left hp-inline">
                        <span class="hp-sm">Level</span>
                        <span class="hp-sm">Experience needed for next level</span>
                      </div>
                    </div>
                  </div>
                  <div class="side pull-right">
                    <div class="head-panel nm">
                      <div class="hp-info hp-simple pull-left hp-inline">
                        <span class="hp-sm">1</span>
                        <span class="hp-sm">0</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar-item">
            <a href="Internal/Logout">
              <i class="fa fa-sign-out"></i> Logout
            </a>
          </div>
        </div>
      </div>
    </nav>
    <div id="page" class="is-fullheight">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import { Carousel, CarouselItem } from 'vue-l-carousel'

export default {
  data() {
    return {
      news: [
        {
          id: 1,
          title: "News 1",
          text: "News 1 text"
        },
        {
          id: 2,
          title: "News 2",
          text: "News 2 text"
        },
        {
          id: 3,
          title: "News 3",
          text: "News 3 text"
        },
        {
          id: 4,
          title: "News 4",
          text: "News 4 text"
        },
      ]
    }
  },
  components: {
    'carousel': Carousel,
    'carousel-item': CarouselItem
  },
  methods: {
    showNews(news) {
      console.log(news)
    }
  }
}
</script>

<style>
nav {
  position: fixed;
  min-height: 40px
}
#page {
  padding-top: 25px;
}
</style>
