<template>
  <div id="app">
    <div class="jumbotron" id="summerPoster">
      <h1>{{title}}</h1>
      <p>{{tour.tour}}</p>
    </div>
    <br />
    <ShowSelection
      v-for="(show, index) in tour.shows"
      v-bind:passed-show="show"
      key="index"
    />
  </div>
</template>

<script>
  import ShowSelection from './ShowSelection.vue'

  export default {
    name: 'app',
    data() {
      return {
        title: 'Dead & Company',
        tour: {}
      }
    },
    methods: {
      getTour() {
           fetch(`https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/tourData.json`, {
             method: 'GET'
           })
             .then(response => response.json())
             .then(json => this.tour = json)
      }
    },
    components: {
      ShowSelection
    },
    mounted() {
      this.getTour();
    }
  }
</script>
