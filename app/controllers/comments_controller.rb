class CommentsController < ApplicationController
  def index #Afficher la liste des commentaires => get /comments
    comments = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at')
                   .where("reply = 0")
                   .order("created_at ASC")
    comments.each do |comment|
      replies = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at')
                    .where(["commentable_id = ? and reply = 1", comment.id])
                    .order("created_at ASC")
      #comment[:replies] = replies
      #render json: replies
    end
    #render json: comments, status: 200
  end

  def create #Créer un nouveau commentaire => post /comments
    comment = Comment.create(username: username, mail: mail, commentable_id: c_id.to_i, commentable_type: c_type, reply: reply.to_i, ip: ip(), created_at: current())
    if !comment.valid?
      render :json {error: comment.errors.messages}
    else
      render :json {message: "Commentaire ajouté avec succès"}
    end
  end

  def update #Editer un commentaire => put /comments/:id
    newContent = Comment.find(params[:id]).content = content
    newContent = newContent.save
    if !newContent.valid?
      render :json {error: comment.errors.messages}
    else
      render :json {message: "Commentaire modifié avec succès"}
    end
  end

  def destroy #Supprimer un commentaire => delete /comments/:id
    Comment.find(params[:id]).destroy
  end
end
