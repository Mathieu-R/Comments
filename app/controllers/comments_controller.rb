class CommentsController < ApplicationController
  def index #Afficher la liste des commentaires => get /comments
    comments = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at')
                   .where(["type = ? and id = ?", params[:type], params[:id]])
                   .order("created_at ASC")
    render json: comments, status: 200
  end

  def create #Créer un nouveau commentaire => post /comments

  end

  def update #Editer un commentaire => put /comments/:id

  end

  def destroy #Supprimer un commentaire => delete /comments/:id

  end
end
