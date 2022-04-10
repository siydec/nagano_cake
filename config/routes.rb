Rails.application.routes.draw do

namespace :admin do
   resources :items
   resources :customers
   root to: "homes#top"
   resources :orders, only: [:show, :update]
   resources :genres
   resources :order_details, only: [:update]
  end


  devise_for :customers, skip: [:passwords] ,controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'

  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

resources :items, only: [:show, :index], controller: "public/items"
resources :addresses, controller: "public/addresses"
resources :orders, controller: "public/orders" do
  collection do
    post 'confirm'
    get 'complete'
  end
end
resources :cart_items, controller: "public/cart_items" do
  collection do
    delete 'destroy_all'
  end
end

resource :customers, except: [:show], controller: "public/customers" do
  collection do
    get 'unsubscribe'
    get 'my_page' => "public/customers#show"
    patch "withdraw"
  end
end

get "about" => "public/homes#about"


  root to: "public/homes#top"






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
