Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get '/about', to: 'public/homes#about', as: 'about'

  get '/customers/my_page', to: 'public/customers#show'
  get '/customers/information/edit', to: 'public/customers#edit'
  patch '/customers/information', to: 'public/customers#update'
  get '/customers/unsubscribe', to: 'public/customers#unsubscribe'
  patch '/customers/withdraw', to: 'public/customers#withdraw'

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, except: [:destroy]
  end

  scope module: :public do
    resources :items, only: [:index, :show]
  end

  scope module: :public do
    resources :addresses, except: [:new, :show]
  end

  delete '/cart_items/destroy_all', to: 'public/cart_items#destroy_all'

  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end

  post '/orders/confirm', to: 'public/orders#confirm'
  get '/orders/complete', to: 'public/orders#complete'

  scope module: :public do
    resources :orders, only: [:new, :create, :index, :show ]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
