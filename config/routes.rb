Rails.application.routes.draw do
  scope module: :public do
    resource :customers,only:[:edit, :show, :update]
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => "homes#about"

    resources :items,only:[:show, :index]

    resource :customers,only:[:create]
    get '/customers/unsubscribe' => "customers#unsubscribe"
    patch '/customers/withdrawal' => "customers#withdrawal"

    resources :cart_items,only:[:create, :index, :update, :destroy]
    get '/cart_items/destroy_all' => "cart_items#destroy_all"

    resources :orders,only:[:create, :index, :new, :edit, :update,:show]
    get "/orders/confirm" =>"orders#confirm"
    get "/orders/thanks" =>"orders#thanks"

    resources :addresses,only:[:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get '/' => "homes#top"

    resources :items,only:[:create, :index, :edit, :update, :new, :show]

    resources :genres,only:[:create, :index, :edit, :update]

    resources :customers,only:[:show, :index, :edit, :update]

    resources :oders,only:[:show, :update]

    resources :oders_details,only:[:update]
  end


  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
