Rails.application.routes.draw do
  resources :merits
  resources :batches do
    member do
      get 'random/:group_count' => 'batches#random'
    end

    resources :divisions
  end

  resources :divisions, only: [] do
    resources :challenges

    member do
      get 'teams'
    end
  end

  resources :groups, only: [:show] do
    member do
      post 'award'
    end
  end

  get ':batch_num/today' => 'divisions#today'
  get 'today' => 'divisions#today'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
