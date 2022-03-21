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
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :customers
    resources :items, only: [:show, :index]


  end

 namespace :admin do
   resources :items
   resources :customers
   root to: "homes#top"
   resources :orders, only: [:show, :index]
  end
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  devise_for :admins
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'

  }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres
end
