# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks, defaults: { format: :json }

  resources :boards, only: %i[show index]
  resources :posts_widgets, only: [] do
    resources :posts, only: %i[edit update new create show increase_like] do
      member do
        get :increase_like
      end
    end
  end

  root to: 'boards#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
