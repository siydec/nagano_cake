Rails.application.routes.draw do



  namespace :public do
    get "registrations/sign_up" => "registrations#new"
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
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres
end
