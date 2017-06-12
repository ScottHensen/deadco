<template>
  <div id="AudioPlayer">
    <img src="./assets/posters/poster_20170527b.png">
    <hello></hello>
    <vue-simple-audio
        :songs="songs"
        width="500"
        initial-volume="40"
        loop auto-play
        repeat
        bg-color="#345345">
    </vue-simple-audio>
  </div>
  </div>
</template>

<script>
import VueSimpleAudio from 'vue-simple-audio'

export default {
  name: 'AudioPlayer',
  components: {
    'vue-simple-audio':VueSimpleAudio
  },
  data(){
    return {
      songs: [{
        "url": "http://localhost:8080/src/assets/music/20170527_lasvegas/deadco170527d1_01_The_Music_Never_Stopped.mp3",
        "songname": "The Music Never Stopped"
      }, {
        "url": "http://localhost:8080/src/assets/music/20170527_lasvegas/deadco170527d1_02_DireWolf.mp3",
        "songname": "Dire Wolf"
      }]
    }
  }
}
</script>
