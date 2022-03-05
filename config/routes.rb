Rails.application.routes.draw do
  namespace :admin do
   resources :items
  end
  root to: "homes#top"
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :genres
end
