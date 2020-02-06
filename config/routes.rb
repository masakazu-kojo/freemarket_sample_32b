Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :users, only: [:index, :show, :edit, :update]

  resources :items
  
  resources :brands, only: [:index,:show,:edit,:update] do
    resources :brand_groups, only: [:index] do
    end
  end
  
  resources :category1s, only: [:index, :show] do
    resources :category2s, only: [:index] do
      resources :category3s, only: [:index] do
      end
    end
  end

end
