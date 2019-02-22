Rails.application.routes.draw do
#TODO/ root to をセッション有無で分岐
  root to: 'posts#index'

  devise_for :users #resources :usersより上に書く
  resources :users, only: [:edit, :update, :destroy, :show] #,:index]
  resources :posts
  get '/posts/hashtag/:name', to:'posts#hashtags'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
