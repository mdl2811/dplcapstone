Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'api/auth'

  namespace :api do
    get 'location', to: 'location#show'
    get 'bio', to: 'bio#show'
    put 'bio', to: 'bio#update'
    get 'sports/index'
    # GET /api/photos
    get 'photos', to: 'photos#index'
    # POST /api/photos
    post 'photos', to: 'photos#create'
    # resources :bio, only: [:show, :update]
    resources :user_sports, only: [:index, :destroy, :create]
    get 'user_post', to: 'posts#user_posts'
    resources :sports do
      resources :posts
    end

    get 'sport_post/:sport_id/', to: 'posts#sport_posts'

    resources :posts

    resources :posts do
      resources :messages
    end
  end

  #Do not place any routes below this one
  get '*other', to: 'static#index'
end
