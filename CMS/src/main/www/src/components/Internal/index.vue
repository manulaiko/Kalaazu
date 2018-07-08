<template>
  <div id="app">
    <nav class="content navbar is-transparent" role="navigation" aria-label="main navigation">
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
            <slider-item v-for="(n, i) in news" :key="i">
              <p @click.prevent="showNews(n)" class="navbar-item">{{ n.title }}</p>
            </slider-item>
          </slider>
        </div>
        <div class="navbar-end">
          <div class="navbar-item has-dropdown is-hoverable">
            <a href="#" class="navbar-link">
              <span class="has-text-warning" v-if="messages.length !== 0">
                <i class="fa fa-envelope"></i>
                 {{ messages.length }}
              </span>
              <i class="fa fa-envelope" v-else></i>
            </a>
            <div class="navbar-dropdown is-right content">
              <div class="navbar-item" v-for="(m, i) in messages" :key="i">
                <div>
                  <h6 @click.prevent="$router.push('/Internal/Messaging/'+ m.id)">{{ m.title.wrap(20) }}</h6>
                  <p>{{ m.text.wrap(40) }}</p>
                  <small>By <a @click.prevent="$router.push('/Internal/User/'+ m.from_accounts_id)">{{ m.author }}</a>,
                    {{ m.time }}
                  </small>
                </div>
                <hr class="navbar-divider" v-if="i < messages.length"/>
              </div>
            </div>
          </div>
          <div class="navbar-item has-dropdown is-hoverable">
            <a href="#" class="navbar-link">
              test
            </a>
            <div class="navbar-dropdown is-right content">
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
        ],
        messages: [
          {
            id: 1,
            title: 'Message 1',
            text: 'Message 1 text',
            from_accounts_id: 1,
            author: 'System',
            time: '2 hours ago'
          },
          {
            id: 2,
            title: 'Message 2 with long title',
            text: 'apiebrnpaioenrobainerbainerb<br/>boernaoernboinerbapaiernbpaienrbinaepirbpaienrb<br/>pienrbpainerbpainerbin<oienrboi<nr><oienrb</nr>',
            from_accounts_id: 1,
            author: 'System',
            time: '3 hours ago'
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
