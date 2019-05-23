# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events
  resources :users, only: %i[new create show]
  resource :session, only: %i[new create destroy]

  root 'events#index'
end
