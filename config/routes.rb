Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :users, only: [:index, :show, :edit, :update] do
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
      get 'search'
    end
  end
  
  resources :brands, only: [:index,:create,:edit,:update] do
    resources :brand_groups, only: [:index,:show] do
    end
  end
  
  resources :categorys, only: [:index, :show]

end
