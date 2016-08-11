class Comment < ActiveRecord::Base
  validates :username, presence: {message: "Vous avez oublié le nom d'utilisateur"}, length: {minimum: 3}
  validates :mail, presence: {message: "Vous avez oublié votre e-mail"}, email: {message: "Mauvais e-mail"}
  validates :username, presence: {message: "Message manquant"}, length: {minimum: 3}
  validates :commentable_id, presence: true, numericality: true
  validates :commentable_type, presence: true
  validates :ip, presence: true
  validates :reply, presence: true, numericality: true
  validates :created_at, presence: true
end
