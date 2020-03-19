Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'} 

  devise_scope :user do
    get 'sign_up', to: 'users/registrations#new'
    post 'sign_up', to: 'users/registrations#create'
  end

  root to: 'items#index'

  resources :users, only: [:index, :show, :edit, :update, :new] do
    collection do
      get 'like'
      get 'notification'
      get 'todo'
      get 'listings_listing'
      get 'listings_in-progress'
      get 'listings_purchased'
      get 'purchase'
      get 'purchased'
    end
  end

  resources :items do
    collection do
      get 'get_category_parent', defaults: { format: 'json' }
      get 'get_category', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get 'search'
    end
    resources :purchase, only: [:index] do
      collection do
        post 'pay'
      end
    end
  end
  
  resources :brands, only: [:index,:create,:edit,:update] do
    resources :brand_groups, only: [:index,:show] do
      member do
        get 'brand_category'
      end
    end
  end
  
  resources :categories, only: [:index, :show]

  resources :card, only: [:new, :show] do
    collection do
      post 'create', to: 'card#create'
      post 'delete', to: 'card#delete'
      post 'show', to: 'card#show'
    end
  end
  
  resources :favorites, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

end
