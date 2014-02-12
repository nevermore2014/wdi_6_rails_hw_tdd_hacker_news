HackerNews::Application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :posts do
      resources :comments do
        resources :votes, defaults: { votable: 'comment' }
      end
    end
  end

  resources :users do
    resources :posts do
      resources :votes, defaults: { votable: 'post'}
    end
  end


  root to: 'posts#index'

end
