<template>
  <div>
    <div id="container"></div>
  </div>
</template>

<script>
  import swfobject from 'swfobject'

  export default {
    data() {
      return {
        resolutionID: 1,
        resolutions: [
          [820, 600],
          [1024, 576],
          [1024, 720],
          [1280, 720],
          [1280, 900]
        ]
      }
    },
    mounted: function () {
      const resolution = this.$data.resolutions[this.$data.resolutionID];

      const flashvars = {
        "lang": "en",
        "userID": 1,
        "factionID": 1,
        "sessionID": "test",
        "basePath": "/spacemap",
        "pid": 563,
        "resolutionID": this.$data.resolutionID,
        "boardLink": "http://localhost/",
        "helpLink": "http://localhost/",
        "loadingClaim": "Loading",
        "chatHost": "http://localhost/",
        "cdn": "http://localhost/",
        "useHash": 1,
        "host": "http://localhost/",
        "gameXmlHash": "060b9c86992a12a6d343395f64852876",
        "resourcesXmlHash": "4f5d6e23ebb06278f110ba358dde28ec",
        "profileXmlHash": "18287bc38698431e80f7cca05e6df2ca",
        "autoStartEnabled": 1,
        "mapID": 1,
        "supportedResolutions": [1, 2, 3, 4, 5],
        "logConfig": "0,300,4,5",
        "instantLogEnabled": 1,
        "doubleClickAttackEnabled": 1,
        "allowChat": 1
      };

      const params = {
        "src": "http://localhost/spacemap/main.swf",
        "version": [11, 0],
        "bgcolor": "#000000",
        "wmode": "direct",
        "allowfullscreen": "true",
        "allowFullScreenInteractive": "true"
      };

      swfobject.embedSWF(
        "http://localhost/spacemap/main.swf",
        "container",
        resolution[0],
        resolution[1],
        "11.0.0",
        "",
        flashvars,
        params
      );
    }
  }
</script>

<style>
  #container {
    color: #FFFFFF;
    background: #000000;
  }
</style>
