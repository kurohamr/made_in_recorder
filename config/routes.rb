# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
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

  resources :users, only: %i[edit update destroy show] # ,:index]
  resources :posts do
    resources :favorites, only: %i[create destroy]
  end

  get '/posts/hashtag/:name', to: 'posts#hashtags'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
