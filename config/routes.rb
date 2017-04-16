Rails.application.routes.draw do

  put 'users/downgrade' => 'users#downgrade'

  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users

  resources :collaborators, only: [:create, :destroy]

  root 'welcome#index'

end
