<template>
  <div id="sets">
    <div>
      <template>
        <v-container>
          <img :src="cardSet.image" height="100px" :alt="cardSet.name">
          <p>{{ cardSet.name }}</p>
          <cards v-if="cardSetCode" :cardSetCode="cardSetCode"></cards>
        </v-container>
      </template>
    </div>
  </div>
</template>

<script>
/* Imports */
import axios from 'axios'
import { loadProgressBar } from 'axios-progress-bar'
import 'axios-progress-bar/dist/nprogress.css'
import Cards from './Cards.vue'

/* data, methods, components... declaration */
export default {
  data () {
    return {
      data: null,
      status: '',
      cardSet: '',
      dataCount: null,
      errorMsg: null,
      cardSetCode: ''
    }
  },
  title () {
    return `PokePare — ${this.cardSetCode}`
  },
  components: {
    'cards': Cards
  },
  methods: {
    showCards () {
      var thisVm = this
      if (thisVm.$route.params) {
        thisVm.cardSetCode = thisVm.$route.params.code
      }
      const cardSetUrl = `${this.$constants('cardSetsUrl')}?code=${encodeURI(thisVm.cardSetCode)}`
      loadProgressBar()
      console.log(cardSetUrl)
      axios.get(cardSetUrl).then(response => {
        console.log(response)
        if (response.data) {
          thisVm.status = response.status
          thisVm.cardSet = response.data.results[0]
        }
      })
    }
  },
  mounted () {
    var thisVm = this
    thisVm.showCards()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
