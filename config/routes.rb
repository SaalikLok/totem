Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :websites, only: [:index, :show, :create, :destroy]
      resources :visits, only: [:show, :create]
    end
  end
end
