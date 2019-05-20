# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resource :session, only: %i[new create destroy]
  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
