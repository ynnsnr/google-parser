Rails.application.routes.draw do
  # get 'analyses/new'
  # get 'analyses/create'
  # get 'analyses/index'
  # get 'analyses/show'
  root to: 'pages#home'
  # get 'pages/home'
  devise_for :users
  resources :analyses, only: [ :index, :show, :new, :create ] do
    collection { post :upload }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
