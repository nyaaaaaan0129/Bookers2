Rails.application.routes.draw do
  root  "homes#top"
  get 'about' => 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show, :create]
  resources :books, only: [:new, :create, :index, :show]
 
end
