Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
    devise_scope :user do
      get 'addresses', to: 'users/registrations#new_address'
      post 'addresses', to: 'users/registrations#create_address'
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

  root to: 'items#index'

  resources :images do
    member do
      get 'show_image'
    end
  end

  resources :users, only: [:show]

  resources :items, only: [:index,:show,:new,:create,:destroy,:edit] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    resources :purchases do
      collection do
        get 'index', to: 'purchases#index'
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
  end  

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  
end

