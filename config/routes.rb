Rails.application.routes.draw do



  namespace :public do
    resources :addresses
    resources :orders do
    collection do
      post 'confirm'
      get 'complete'
     end
    end
    resources :cart_items do
    collection do
    delete 'destroy_all'
     end
    end




    root to: "homes#top"
    get "about" => "homes#about"
    resource :customers do
      collection do
       get 'unsubscribe'
       patch 'withdraw'
     end
   end
    resources :items, only: [:show, :index]


  end

 namespace :admin do
   resources :items
   resources :customers
   root to: "homes#top"
   resources :orders, only: [:show, :index]
  end
  root to: "public/homes#top"
  get "home/about" => "homes#about", as: "about"
  get "homes/top"
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords] ,controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'

  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres
end
