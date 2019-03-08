Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'users/registrations'
   }
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:edit, :update, :destroy, :show] #,:index]
  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end

  get '/posts/hashtag/:name', to:'posts#hashtags'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
