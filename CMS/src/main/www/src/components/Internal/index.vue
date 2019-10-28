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
              {{ account.name }}
            </a>
            <div class="navbar-dropdown is-right content">
              <div class="navbar-item">
                <div class="card">
                  <div class="card-content">
                    <div class="media">
                      <div class="media-left">
                        <figure class="image is-48x48">
                          <img :src="'/img/rank/' + account.rank_id + '.jpg'">
                        </figure>
                      </div>
                      <div class="media-content">
                        <p class="title is-4">{{ account.rank_name }}</p>
                        <p class="title is-6">Level {{ account.level }}</p>
                        <p class="subtitle is-6">{{ account.next_level_exp }} experience points for next level</p>
                      </div>
                    </div>

                    <div class="content">
                      <p>{{ account.experience }} experience points</p>
                      <p>{{ account.honor }} honor points</p>
                      <p>{{ account.uridium }} uridium</p>
                      <p>{{ account.credits }} credits</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar-item">
            <a @click.prevent="$router.push('/External')">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>
      </div>
    </nav>
    <div class="columns is-fullheight">
      <div class="column is-2 is-sidebar-menu is-hidden-mobile">
        <aside class="menu content">
          <ul class="menu-list">
            <li><a @click.prevent="$router.push('/Internal/Start')"><i class="fa fa-home"></i> Home</a></li>
            <li><a @click.prevent="$router.push('/Internal/Map')"><i class="fa fa-rocket"></i> Map</a></li>
          </ul>
        </aside>
      </div>
      <div class="column is-main-content">
        <v-dialog/>
        <router-view/>
      </div>
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
        ],
        account: {
          id: 1,
          name: 'test',
          rank_id: 1,
          rank_name: 'Basic space pilot',
          level: 1,
          next_level_exp: 10000,
          experience: 0,
          honor: 0,
          credits: 40000,
          uridium: 10000
        }
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

  .menu-list {
    margin-left: 0 !important;
  }

  .menu-list li {
    list-style: none;
  }

  .card {
    background-color: transparent;
    color: inherit;
    box-shadow: none;
  }
</style>
