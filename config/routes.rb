Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :agenda_items

      resources :families

      resources :user_types

      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "user_types#index"
  resources :group_members
  resources :messages
  resources :message_groups
  resources :notifications
  resources :comments
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
