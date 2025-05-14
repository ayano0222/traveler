Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'confirm'
    end
  end

  resource :messages, only: [:create]
  resource :rooms, only: [:create, :index, :show]

  get "up" => "rails/health#show", as: :rails_health_check
  root :to => 'homes#top'
end


