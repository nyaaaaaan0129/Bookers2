Rails.application.routes.draw do
  devise_for :users
  root  'homes#top'
  get 'home/about', to: 'homes#about'
  get 'users/search', to: 'search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show, :create, :edit, :update, :index] do
  	member do
  		get :following, :followers
  	end
  end

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resource :book_comments, only:[:create, :destroy]
     resource :favorites, only: [:create, :destroy]
  end
  resources :relationships,       only: [:create, :destroy]
end
