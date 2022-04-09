<template>
  <div class="home">
     Que ondas  {{msg}}
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'Home',
  components: {
    HelloWorld
  },
  data(){
    return {
      msg : process.env.ENV_DEPLOY + " " +process.env.VUE_BACKEND_URL
    }
  }
}
</script>
