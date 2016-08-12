<template>
  <div class="ui comments">
    <comment :comment="comment" :ip="ip" v-for="comment in comments"></comment> <!-- Chaque commentaire -->
  </div>
    <div>

    </div>
</template>

<script type=text/babel>
    import axios from 'axios'
    import comment from 'components/comment'

    export default{
        props: {
          ip: String
        },
        components: { comment },
        data(){
            return{
                comments: []
            }
        },
        ready () {
          axios.get('/comments').then((response) => {
            this.comments = response.data
          })
        }

    }
</script>

<style>
  body {

  }
</style>
