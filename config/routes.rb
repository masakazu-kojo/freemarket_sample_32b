Rails.application.routes.draw do
  devise_for :users
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

  resources :items
  
  resources :brands, only: [:index,:create,:edit,:update] do
    resources :brand_groups, only: [:index,:show] do
    end
  end
  
  resources :category1s, only: [:index, :show] do
    resources :category2s, only: [:show] do
      resources :category3s, only: [:show] do
      end
    end
  end

end
