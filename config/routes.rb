Rails.application.routes.draw do
  resources :batches do
    member do
      get 'random/:group_count' => 'batches#random'
    end

    resources :divisions
  end

  get ':batch_num/today' => 'divisions#today'
  get 'today' => 'divisions#today'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
