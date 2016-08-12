class CommentsController < ApplicationController
  def index #Afficher la liste des commentaires => get /comments
    comments = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at')
                   .where("reply = 0")
                   .order("created_at ASC")
    comments = comments.as_json
    comments.each do |comment|
      puts comment[:id]
      replies = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at')
                    .where("commentable_id = ?", [comment[:id]])
                    .where("reply = 1")
                    .order("created_at ASC")
      puts replies
      comment[:replies] = replies
      #render json: replies
    end
    render json: comments, status: 200
  end

  def create #Créer un nouveau commentaire => post /comments

    ip = request.remote_ip

    comment = Comment.create(username: params[:username], mail: params[:mail], content: params[:content], commentable_id: params[:id].to_i, commentable_type: params[:commentable_type], reply: params[:reply].to_i, ip: ip, created_at: Time.now.to_s(:db))
    if !comment.valid?
      render json: {error: comment.errors.messages}
    else
      render json: {message: "Commentaire ajouté avec succès"}
    end
  end

  def update #Editer un commentaire => put /comments/:id
    newContent = Comment.find(params[:id])
    newContent.content = params[:content]
    newContent = newContent.save
    if newContent == false
      render json: {error: comment.errors.messages}
    else
      render json: {message: "Commentaire modifié avec succès !"}
    end
  end

  def destroy #Supprimer un commentaire => delete /comments/:id
    comment = Comment.find(params[:id])
    if comment.ip == request.remote_ip
      comment.destroy
      render json: {message: "Commentaire supprimé avec succès !"}
    else
      render json: {error: "Ce commentaire n'a pas pu être supprimé"}
    end
  end
end
