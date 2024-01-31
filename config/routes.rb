Rails.application.routes.draw do
  root 'location#index'
  resources :location, only: %i[index create show] do
    resources :weather, only: %i[index create show]
  end
end
