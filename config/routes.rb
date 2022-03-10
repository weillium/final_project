Rails.application.routes.draw do
  resources :tags
  resources :photos
  resources :scores
  resources :budget_types
  resources :budget_lines
  resources :agenda_items
  resources :families
  resources :user_types
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
