<template>

<div class="app">
    <header>
      <Navbar />
    </header>

  <div class="bg-gray-200 h-full md:h-screen pt-20">  
    <router-view/>
  </div>

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