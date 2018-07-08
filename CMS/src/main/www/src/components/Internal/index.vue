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
          <slider height="auto" width="500px" :control-btn="false" :indicators="false" class="navbar-item">
            <slider-item v-for="(i, index) in news" :key="index">
              <p @click.prevent="showNews(i)" class="navbar-item">{{ i.title }}</p>
            </slider-item>
          </slider>
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
      <v-dialog/>
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
  import {Slider, SliderItem} from 'vue-easy-slider'

  export default {
    data: function () {
      return {
        news: [
          {
            title: 'Hi',
            text: 'Yes'
          },
          {
            title: 'No',
            text: 'Hue'
          }
        ]
      }
    },
    components: {
      Slider,
      SliderItem
    },
    methods: {
      showNews(news) {
        this.$modal.show('dialog', {
          title: news.title,
          text: news.text
        });
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
