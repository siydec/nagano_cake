Rails.application.routes.draw do



  namespace :public do

    root to: "homes#top"
    get "about" => "homes#about"

  end

 namespace :admin do
   resources :items
   resources :customers
   root to: "homes#top"
   resources :orders, only: [:show]
  end
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  devise_for :admins
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres
end
