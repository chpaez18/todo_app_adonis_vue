<template>



  <div class="bg-gray-200 h-full md:h-screen">  
  <header>
    <Navbar />
  </header>
    <router-view/>
  </div>

</template>

<style lang="scss">

</style>

<script>
  import Navbar from './components/Navbar.vue'

  export default {
    components:{
      Navbar
    }
  }
</script>