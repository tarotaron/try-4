Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  get "home/about" => "homes#about"
  resources :users do
    resource :relationships, only:[:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :books do
  	resources :book_comments, only:[:create, :destroy]
  	resource :favorites, only:[:create, :destroy]
  end
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
