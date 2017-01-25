Rails.application.routes.draw do

  # get 'charges/new'

  put 'users/downgrade' => 'users#downgrade'

  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
