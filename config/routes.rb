# frozen_string_literal: false

# Routes
Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: %i[new create]
  end
end
