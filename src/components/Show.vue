<template>
  <div>
    <div class="jumbotron" id="show-20170527">
      <h1>Las Vegas, NV</h1>
      <p>Saturday, May 27, 2017</p>
      <p>{{$route.params.id}}</p>
      <p><router-link to="/">home</router-link></p>
    </div>
    <audio id="audio" preload="auto" tabindex="0" controls="" >
      <source src="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_01_The_Music_Never_Stopped.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
    <ul id="playlist">
      <li class="active">
          <a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_01_The_Music_Never_Stopped.mp3">The Music Never Stopped </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_02_Dire_Wolf.mp3"              >Dire Wolf               </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_03_Jack_Straw.mp3"             >Jack Straw              </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_04_Loser.mp3"                  >Loser                   </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_05_Friend_Of_The_Devil.mp3"    >Friend of the Devil     </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_06_BrownEyed_Women.mp3"        >Brown-Eyed Women        </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d1_07_Bird_Song.mp3"              >Bird Song               </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d2_01_Playin_In_The_Band.mp3"     >Playin in the Band      </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d2_02_Deal.mp3"                   >Deal                    </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d2_03_China_Cat_Sunflower.mp3"    >China Cat Sunflower     </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d2_04_I_Know_You_Rider.mp3"       >I Know You Rider        </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d2_05_Drums.mp3"                  >Drums                   </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d2_06_Space.mp3"                  >Space                   </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d3_01_The_Other_One.mp3"          >The Other One           </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d3_02_Black_Peter.mp3"            >Black Peter             </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d3_03_One_More_Saturday_Night.mp3">One More Saturday Night </a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d3_04_Knockin_On_Heavens_Door.mp3">Knockin on Heaven's Door</a></li>
      <li><a href="https://s3-us-west-2.amazonaws.com/deadco.show/2017Summer/music/20170527_lasvegas/deadco170527d3_05_Playin_In_The_Band.mp3"     >Playin in the Band      </a></li>
    </ul>
  </div>
</template>

<script>
  export default {
    // props: ['id'],
    data() {
      return {
        id: ""
      }
    },
    methods: {
        init: function() {
          var current  = 0;
          var audio    = $('#audio');
          var playlist = $('#playlist');
          var tracks   = playlist.find('li a');
          var len      = tracks.length - 1;
          var link;
          audio[0].volume = .30;
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
    mounted: function() {
      this.init();
    }
  }
</script>
