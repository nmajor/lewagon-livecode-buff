Rails.application.routes.draw do
  resources :batches do
    member do
      get 'random/:group_count' => 'batches#random'
    end
  end

  resources :divisions do
    collection do
      get 'today' => 'divisions#today'
    end
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
