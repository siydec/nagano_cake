Rails.application.routes.draw do




  namespace :public do

    devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'

  }

    root to: "homes#top"
    get "about" => "homes#about"


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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres
end
