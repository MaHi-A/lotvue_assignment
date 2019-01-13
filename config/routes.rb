# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  devise_scope :user do
    get '/sign_in' => 'devise/sessions#new'
    get '/sign_out' => 'devise/sessions#destroy'
  end
  
  get '/dashboard', to: 'dashboard#posts'

  resources :users do
    resources :posts do
      resources :comments
    end
  end
end
