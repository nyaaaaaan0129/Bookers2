Rails.application.routes.draw do
  devise_for :users
  root  'homes#top'
  get 'home/about', to: 'homes#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show, :create, :edit, :update, :index]

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resource :book_comments, only:[:create, :destroy]
     resource :favorites, only: [:create, :destroy]
  end
end
