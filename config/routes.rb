Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customers do
    get '/', to: "public/homes#top"
    get '/about', to: "public/homes#about"
    get '/items', to: "public/items#index"
    get '/cart_items', to: "public/cart_items#index"
    get '/customers/my_page', to: "public/customers#show"
    get '/customers/edit', to: "public/customers#edit", as: :public_customer_edit
    patch '/customers', to: "public/customers#update"
    get '/customers/unsubscribe', to: "public/customers#unsubscribe"
    patch '/customers/withdraw',to: "public/customers#withdraw"
    get '/', to: "public/homes#top", as: :root
    get 'addresses', to: "public/addresses#index"
    get '/addresses/:id/edit', to: "public/addresses#edit", as: :public_address_edit
    post '/addresses', to: "public/addresses#create", as: :public_address_creste
    patch '/addresses/:id', to: "public/addresses#update"
    delete '/addresses/:id', to: "public/addresses#destroy", as: :public_address_destroy
    get '/orders', to: "public/orders#index"
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions",
  }


  devise_scope :admin do
  get '/admin', to: 'admin/homes#top', as: :admin
  get '/admin/items', to: 'admin/items#index'
  get '/admin/items/new', to: 'admin/items#new'
  post '/admin/items', to: 'admin/items#create'
  get '/admin/items/:id', to: 'admin/items#show', as: :admin_items_show
  get '/admin/items/:id/edit', to: 'admin/items#edit', as: :admin_items_edit
  patch '/admin/items/:id', to: 'admin/items#update', as: :admin_items_update
  get '/admin/customers', to: 'admin/customers#index'
  get '/admin/customers/:id', to: 'admin/customers#show', as: :admin_customer_show
  get '/admin/customers/:id/edit', to: 'admin/customers#edit', as: :admin_customer_edit
  patch '/admin/customers/:id', to: 'admin/customers#update', as: :admin_customer_update
  get '/admin/genres', to: 'admin/genres#index'
  post '/admin/genres', to: 'admin/genres#create'
  get '/admin/genres/:id/edit', to: 'admin/genres#edit', as: :admin_genres_edit
  patch '/admin/genres/:id', to: 'admin/genres#update', as: :admin_genres_update
  get '/admin/orders/:id', to: 'admin/orders#show', as: :admin_order_show
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
