<template>
  <div class="show-card col-md-4">
    <!-- <div class="show-card" @click="playShow"> -->
      <div class="card-block" v-bind:id="show.date"  @click="displayShow">
        <div class="card-poster col-md-6">
          <img class="poster-thumbnail" v-bind:src="show.poster" alt="poster">
        </div>
        <div class="card-details col-md-6">
          <h4 class="card-title">{{show.date}}</h4>
          <p  class="card-text" >{{show.day}}</p>
          <p  class="card-text" >{{show.venue}}</p>
          <p  class="card-text" >{{show.city}}</p>
          <p  class="card-text" >{{show.state}}</p>
        </div>
      </div>
  </div>
</template>

<script>
  export default {
    props: ['passedShow', 'index'],
    data() {
      return {
        show: {}
      }
    },
    methods: {
      switchItem() {

      }
    },
    created() {
      this.show = this.passedShow
    }
}
</script>
