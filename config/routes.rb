HackerNews::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :posts do
      resources :comments
    end
  end

  # resources :comments do
  #   resources :votes
  # end



  root to: 'posts#index'

end
