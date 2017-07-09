<template>
  <li><a :href="song.file">{{song.title}}</a></li>
</template>

<script>
  export default {
    props: ['passedSong', 'index'],
    data() {
      return {
        song: {}
      }
    },
    created() {
      this.song = this.passedSong
    }
}
</script>
