Rails.application.routes.draw do
    root to: 'toppages#index'
    
    resource :toppages do
        member do
          get :ways_ranking
          get :hobbies_ranking
        end
    end
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    
    get 'signup', to: 'users#new'
    resources :users do
        member do
          get :followings
          get :followers
          get :like_hobbies
          get :like_ways
        end
    end
    
    resources :hobbies, only: [:index, :create, :new, :destroy] do
        member do
          post :new
        end
    end
    resources :relationships, only: [:create, :destroy]
    resources :ways do
        resources :comments, only: [:create]
        collection do
          get :search
        end 
    end
    
    resources :comments, only: [:show, :create]
   
    resources :favorite_hobbies, only: [:create, :destroy]
    resources :favorite_ways, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
