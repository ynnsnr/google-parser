Rails.application.routes.draw do
  get 'results/show'
  root to: 'pages#home'
  devise_for :users
  resources :analyses, only: [ :index, :show, :new, :create ] do
    collection do
      post :upload, get: :new_csv
    end
  end
  resources :results do
    collection do
      get :download
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
