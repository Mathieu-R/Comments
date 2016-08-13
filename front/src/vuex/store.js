import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
    comments: []
}

const mutations = {
    ADD_COMMENTS (state, comment) {
        state.comments.push(comment)
    }
    ADD_COMMENT (state, comment) {
        if (comment.reply == 1) {
            let index = state.comments.findIndex((com) => com.id == comment.commentable_id)
            state.comments[index].replies.push(comment)
        }
        else {
            state.comments.push(commment)
        }
    }
    UPDATE_COMMENT (state, comment) {
        if (comment.reply == 1) { // Si c'est une réponse
            let parentIndex = state.comments.findIndex((com) => com.id == comment.commentable_id)
            let index = state.comments[parentIndex].replies.findIndex((com) => com.id == comment.id)
            state.comments[parentIndex].replies.[index].content = comment.content // Modifie le commentaire enfant
        } else {
            let index = state.comments.findIndex((com) => com.id == comment.id)
            state.comments.[index].content = comment.content // Modifie le commentaire parent
        }

    }
    DELETE_COMMENT (state, comment) {
        if (comment.reply == 1) { // Si c'est une réponse
            let parentIndex = state.comments.findIndex((com) => com.id == comment.commentable_id)
            let index = state.comments[parentIndex].replies.findIndex((com) => com.id == comment.id)
            state.comments[parentIndex].replies.splice(index, 1) // Supprime le commentaire
        } else {
            let index = state.comments.findIndex((com) => com.id == comment.id)
            state.comments.splice(index, 1) // Supprime le bloc de commentaires
        }
    }
}

export default new Vuex.Store({
    state,
    mutations
})