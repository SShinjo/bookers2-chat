Rails.application.routes.draw do
 devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update] do
  	resource :relationship, only: [:create, :destroy]
  	member do 
  		get :following, :followers
  	end
  end
  resources :books do
  	resource :favorite, only: [:create, :destroy]
  end
  resources :book_comments, only: [:create, :destroy]

  resources :chats, only: [:show]

  get '/search' => 'searchs#search'

end
