Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

  devise_for :users

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] 
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  end

  get ':id/follow' => 'users#follow', as: 'follow'
  get ':id/follower' => 'users#follower', as: 'follower'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
