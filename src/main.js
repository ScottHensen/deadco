import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Tour from './components/Tour.vue'
import Show from './components/Show.vue'

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Tour },
    { path: '/show/:id', name: 'show', component: Show }  ]
})

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
