<template>
  <div class="show-card col-sm-6 col-md-4 col-lg-3">
    <router-link :to="{ name: 'show', params: { show: show } }">
      <div class="card-block" v-bind:id="show.date">
        <div class="card-poster col-md-6">
          <img class="poster-thumbnail" v-bind:src="show.poster" alt="poster">
        </div>
        <div class="card-details col-md-6">
          <h4 class="card-title show-date"><span>{{formattedShowDay}},</span><span>{{formattedShowDate}}</span></h4>
          <p  class="card-text" >{{show.venue}}</p>
          <p  class="card-text" >{{show.city}}</p>
          <p  class="card-text" >{{show.state}}</p>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
  import moment from 'moment'
  export default {
    props: ['passedShow', 'index'],
    data() {
      return {
        show: {},
        formattedShowDate: ""
      }
    },
    created() {
      this.show = this.passedShow
      this.formattedShowDay  = moment(this.show.date,"YYYYMMDD").format('dddd');
      this.formattedShowDate = moment(this.show.date,"YYYYMMDD").format('MMMM Do YYYY');
    }
}
</script>
