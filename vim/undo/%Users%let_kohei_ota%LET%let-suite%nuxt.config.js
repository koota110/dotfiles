Vim�UnDo� DBx	E�O�=Ćoث�5� ���߼;3u�   e           ?                       _�]S    _�                        D    ����                                                                                                                                                  t                                                                                                                                                                                                       _�]S    �         e      @    ENDPOINT_MSS: process.env.ENDPOINT_MSS || 'http://localhost'5�_�                            ����                                                                                                                                                  t                                                                                                                                                                                                       _�gR     �       f       e   export default {   
  proxy: {   I    '/api/analyzer': process.env.ENDPOINT_ANALYZER || 'http://localhost',   ?    '/api/mss': process.env.ENDPOINT_MSS || 'http://localhost',   E    '/api/config': process.env.CONFIG_ENDPOINT || 'http://localhost',   @    '/api/cicd': process.env.CICD_ENDPOINT || 'http://localhost'     },     env: {   <    ANALYZER_HOST: process.env.ANALYZER_HOST || 'localhost',   K    ENDPOINT_ANALYZER: process.env.ENDPOINT_ANALYZER || 'http://localhost',   -    I18N_ENDPOINT: process.env.I18N_ENDPOINT,   1    CONFIG_ENDPOINT: process.env.CONFIG_ENDPOINT,   -    CICD_ENDPOINT: process.env.CICD_ENDPOINT,   @    ENDPOINT_MSS: process.env.ENDPOINT_MSS || 'http://localhost'     },     mode: 'spa',     /*      ** Headers of the page      */   	  head: {   :    titleTemplate: '%s - ' + process.env.npm_package_name,   .    title: process.env.npm_package_name || '',       meta: [         { charset: 'utf-8' },   K      { name: 'viewport', content: 'width=device-width, initial-scale=1' },         {           hid: 'description',           name: 'description',   :        content: process.env.npm_package_description || ''         }       ],   G    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]     },     /*   &   ** Customize the progress-bar color      */   .  loading: '~/components/globals/loading.vue',     /*      ** Global CSS      */   
  css: [],     /*   -   ** Plugins to load before mounting the App      */     plugins: [       '@/plugins/axios/index',       '@/plugins/i18n/index',   #    '@/plugins/vue-fusioncharts.js'     ],         /*      ** Nuxt.js dev-modules      */   >  buildModules: ['@nuxt/typescript-build', '@nuxtjs/vuetify'],     /*      ** Nuxt.js modules      */     modules: [   *    // Doc: https://axios.nuxtjs.org/usage       '@nuxtjs/axios',       '@nuxtjs/proxy',       'nuxt-fontawesome'     ],     /*      ** FontAwesome      */     fontawesome: {       component: 'fa'     },     /*       ** Axios module configuration   *   ** See https://axios.nuxtjs.org/options      */     axios: {},     /*   "   ** vuetify module configuration   6   ** https://github.com/nuxt-community/vuetify-module      */     vuetify: {   1    customVariables: ['~/assets/variables.scss'],       theme: {         themes: {           light: {             primary: '#3f51b5',             secondary: '#b0bec5',             accent: '#8c9eff',             error: '#b71c1c'   	        }         }       }     },     /*      ** Build configuration      */   
  build: {       /*   *     ** You can extend webpack config here        */       // extend(config, ctx) {}     }   };5�_�                        ?    ����                                                                                                                                                  u                                                                                                                                                                                                       _�8�     �         e      A    ENDPOINT_MSS: process.env.ENDPOINT_MSS || 'http://localhostgs       '5��