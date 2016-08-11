Rails.application.routes.draw do
  get '/comments/:type&:id' => 'comments#index'
  post '/comments/:id' => 'comments#create'
  put '/comments/:id' => 'comments#update'
  delete '/comments/:id' => 'comments#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
