Rails.application.routes.draw do
  # root to: 'users#new'
  root to: 'posts#index'
  devise_for :users
  resources :posts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
