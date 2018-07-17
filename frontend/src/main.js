// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import BootstrapVue from 'bootstrap-vue'

/* boostrap's css import, needed for bootstrap to work */
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUser } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import store from './store'
import titleMixin from './mixins/titleMixin'
import VueLodash from 'vue-lodash'

const options = { name: 'lodash' } // customize the way you want to call it

Vue.mixin(titleMixin)

library.add(faUser)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(VueLodash, options) // options is optional

require('vue2-animate/dist/vue2-animate.min.css')

/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  components: {
    App,
    BootstrapVue
  },
  template: '<App/>'
})
