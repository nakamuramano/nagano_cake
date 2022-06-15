Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customers do
    get '/about', to: "public/homes#about"
    get '/items', to: "public/items#index"
    get '/', to: "public/homes#top", as: :root
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions",
  }


  devise_scope :admin do
  get '/admin', to: 'admin/homes#top'
  get '/admin/items', to: 'admin/items#index'
  get '/admin/items/new', to: 'admin/items#new'
  post '/admin/items', to: 'admin/items#create'
  get '/admin/items/:id', to: 'admin/items#show', as: :admin_items_show
  get '/admin/items/:id/edit', to: 'admin/items#edit', as: :admin_items_edit
  patch '/admin/items/:id', to: 'admin/items#update'
  get '/admin/customers', to: 'admin/customers#index'
  get '/admin/genres', to: 'admin/genres#index'
  post '/admin/genres', to: 'admin/genres#create'
  get '/admin/genres/:id/edit', to: 'admin/genres#edit', as: :admin_edit
  patch '/admin/genres/:id', to: 'admin/genres#update', as: :admin_update


  patch '/admin/orders/:id', to: 'admin/orders#update'
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
