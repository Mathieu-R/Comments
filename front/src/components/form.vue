<template>
    <div>
      <h3 class="ui header dividing">Commenter</h3>
      <form class="ui form" action="">
        <div class="two field">
          <div class="field">
            <label>Pseudo</label>
            <input type=text v-model="username">
          </div>
          <div class="field">
            <label>E-Mail</label>
            <input type=text v-model="mail">
          </div>
        </div>
        <div class="field">
          <label>Commentaire</label>
          <textarea v-model="content"></textarea>
        </div>
        <button class="ui blue labeled submit icon button">
          <i class="icon edit"></i>Commenter
        </button>
      </form>
    </div>
</template>

<script type=text/babel>
    export default{
        props: {
          model: String,
          reply: {
            type: Number,
            default: 0
          }
        },
        data() {
            return {
              username: '',
              mail: '',
              content: ''
            }
        },
        ready () {

        }
    }
</script>

<style>
  body {

  }
</style>
