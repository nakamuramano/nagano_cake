Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customers do
    get '/about', to: "public/homes#about"
    get '/items', to: "public/items#index"
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions",
  }

  devise_scope :admin do
  get '/admin', to: 'admin/homes#top'
  get '/admin/items', to: 'admin/items#index'
  get '/admin/customers', to: 'admin/customers#index'
  get '/admin/genres', to: 'admin/genres#index'
  patch '/admin/orders/:id', to: 'admin/orders#update'
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
