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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
