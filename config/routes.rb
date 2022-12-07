Rails.application.routes.draw do



  scope module: :public do
    root to:  'homes#top'
    get 'home/about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    get 'customers/my_page' => "customers#show"
    get 'customers/information/edit' => "customers#edit"
    patch 'customers/information' => "customers#update"
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    get 'orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
  end


  namespace :admin do
    root "homes#top"
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index,:edit,:update,:show]
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
