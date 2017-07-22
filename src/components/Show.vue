<template>
  <div>
    <div class="jumbotron" :id="show.date" :style="{ backgroundImage: 'url(' + show.poster + ')' }" >
      <h1>{{show.city}}</h1>
      <p>{{show.venue}}</p>
      <p>{{formattedShowDate}}</p>
      <p><router-link to="/"><img src="../assets/img/ruby_slippers.png" alt="home" height="42" width="42"></router-link></p>
    </div>

    <audio id="audio" preload="auto" tabindex="0" controls="" >
      <source src="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_01_The_Music_Never_Stopped.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>

<!-- TODO:  this is stupid; make it a v-for set, then v-for song -->
    <ul id="playlist">
      <Song
        v-for="(song, index) in show.sets[0].songs"
        v-bind:passed-song="song"
        key="index"
      />
      <Song
        v-for="(song, index) in show.sets[1].songs"
        v-bind:passed-song="song"
        key="index"
      />
      <Song
        v-for="(song, index) in show.sets[2].songs"
        v-bind:passed-song="song"
        key="index"
      />
    </ul>

  </div>
</template>

<script>
  import moment from 'moment'
  import Song   from './Song.vue'

  export default {
    props: ['show'],
    data() {
      return {
        formattedShowDate: ""
      }
    },
    methods: {
        init: function() {
          this.formattedShowDate = moment(this.show.date,"YYYYMMDD").format('dddd, MMMM Do YYYY');
          $('ul#playlist li:first').addClass("active");

          //TODO:  all this audio player shit should be in its own file
          var current  = 0;
          var audio    = $('#audio');
          var playlist = $('#playlist');
          var tracks   = playlist.find('li a');
          var len      = tracks.length - 1;
          var link;
          audio[0].volume = .50;
          audio[0].play();

          playlist.find('a').click(function (e) {
              e.preventDefault();
              link    = $(this);
              current = link.parent().index();
              run(link, audio[0]);
          });

          audio[0].addEventListener('ended', function(e) {
              current++;
              if(current == len){
                  current = 0;
                  link = playlist.find('a')[0];
              }else{
                  link = playlist.find('a')[current];
              }
              run($(link), audio[0]);
          });

          function run(link, player) {
                  player.src = link.attr('href');
                  var par = link.parent();
                  par.addClass('active').siblings().removeClass('active');
                  player.load();
                  player.play();
          }
        }
    },
    components: {
      Song
    },
    created: function() {
      window.scrollTo(0,0);
    },
    mounted: function() {
      this.init();
    }
  }
</script>
