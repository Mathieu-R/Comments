class CommentsController < ApplicationController
  def index #Afficher la liste des commentaires => get /comments
    comments = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at') #Sélectionne les messages qui ne sont pas des réponses
                   .where("reply = 0")
                   .order("created_at ASC")
    comments = comments.as_json #Convertis le model en json
    comments.each do |comment| #Pour chaque message
      replies = Comment.select('id, username, content, commentable_id, commentable_type, reply, created_at, updated_at') #On sélectionne les réponse à ce message
                    .where("commentable_id = ?", [comment['id']])
                    .where("reply = 1")
                    .order("created_at ASC")
      comment[:replies] = replies #On l'ajoute à la clé replies de ce message
      #render json: replies
    end
    render json: comments, status: 200 #On renvoi le tout
  end

  def create #Créer un nouveau commentaire => post /comments

    ip = request.remote_ip #Ip du client

    #Insert le message dans la db
    comment = Comment.create(username: params[:username], mail: params[:mail], content: params[:content], commentable_id: params[:id].to_i, commentable_type: params[:commentable_type], reply: params[:reply].to_i, ip: ip, created_at: Time.now.to_s(:db))
    if !comment.valid? #S'il y a une erreur
      render json: {error: comment.errors.messages}
    else #Sinon tout va bien
      render json: {message: "Commentaire ajouté avec succès"}
    end
  end

  def update #Editer un commentaire => put /comments/:id
    newContent = Comment.find(params[:id]) #Recherche le commentaire qui correspond à l'id
    newContent.content = params[:content] #Modifie son contenu
    newContent = newContent.save #Sauvegarde le commentaire
    if newContent == false #S'il y a une erreur
      render json: {error: comment.errors.messages}
    else #Sinon
      render json: {message: "Commentaire modifié avec succès !"}
    end
  end

  def destroy #Supprimer un commentaire => delete /comments/:id
    comment = Comment.find(params[:id]) #Recherche le commentaire qui correspond à l'id
    if comment.ip == request.remote_ip #Si l'ip du commentaire est égale à l'ip du client
      comment.destroy #On supprime le commentaire
      render json: {message: "Commentaire supprimé avec succès !"}
    else #Sinon 
      render json: {error: "Ce commentaire n'a pas pu être supprimé"}
    end
  end
end
