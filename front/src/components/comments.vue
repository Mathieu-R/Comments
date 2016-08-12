<template>
  <div class="ui comments">
    <comment :comment="comment" :ip="ip" v-for="comment in comments"></comment> <!-- Chaque commentaire -->
    <comment-form :model=model></comment-form>
  </div>
    <div>

    </div>
</template>

<script type=text/babel>
    import axios from 'axios'
    import comment from 'components/comment'
    import commentForm from 'components/form'

    export default{
        props: {
          ip: String
        },
        components: { comment, commentForm },
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
