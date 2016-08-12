<template>
    <div class="comment">

    </div>
</template>

<script type=text/babel>
    import axios from 'axios'

    export default{
        props: {
          ip: String,
          comment: Object
        },
        data() {
            return{
                msg:'hello vue'
            }
        },
        ready() {

        }

    }
</script>

<style>
  body {

  }
</style>
