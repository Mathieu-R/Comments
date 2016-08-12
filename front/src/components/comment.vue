<template>
    <div class="comment">
      <div class="avatar"><img :src="'https://www.gravatar.com/avatar/' + comment.mail" alt="avatar"></div>
      <div class="content">
        <div class="author">{{ comment.username }}</div>
        <div class="metadata">
          <span class="date">{{ comment.created_at }}</span>
        </div>
        <div class="text">
          {{ comment.content }}
        </div>
        <div class="actions">
          <a href="#">Répondre</a>
        </div>
      </div>
      <div class="comments">
        <comment :comment="reply" v-for="reply in comment.replies" :ip="ip"></comment> <!-- Composant à l'intérieur de lui-même -->
        <comment-form :id=comment.commentable_id :model=comment.commentable_type :reply=comment.id v-if="comment.reply == 0"></comment-form>
      </div>
    </div>
</template>

<script type=text/babel>
    import axios from 'axios'
    import commentForm from 'components/form'

    export default {
        name: 'comment',
        components: { commentForm },
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
