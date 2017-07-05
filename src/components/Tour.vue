<template>
  <div id="app">
    <div class="jumbotron" id="summerPoster">
      <h1>{{title}}</h1>
      <p>{{subtitle}}</p>
    </div>
    <br />
    <ShowSelection
      v-for="(show, index) in shows"
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
        subtitle: 'Summer 2017',
        shows: [
            {
              date: "20170527",
              day: "Saturday",
              venue: "MGM Grand Garden Arena",
              city: "Las Vegas",
              state: "NV",
              // poster: "./src/assets/posters/poster_20170527b_lasvegas.jpg"
              poster: "https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/posters/poster_20170527b_lasvegas.jpg"
            },
            {
              date: "20170528",
              day: "Sunday",
              venue: "Ak-Chin Pavillion",
              city: "Phoenix",
              state: "AZ",
              // poster: "./src/assets/posters/poster_20170528_phoenix.jpg"
              poster: "https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/posters/poster_20170528_phoenix.jpg"
            },
            {
              date: "20170531",
              day: "Wednesday",
              venue: "Hollywood Bowl",
              city: "Los Angeles",
              state: "CA",
              // poster: "./src/assets/posters/poster_20170531_hollywood.jpg"
              poster: "https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/posters/poster_20170531_hollywood.jpg"

            }
        ]
      }
    },
    components: {
      ShowSelection
    }
  }
</script>
