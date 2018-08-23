Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :update, :edit] do
    resources :user_activities, only: :create
    resources :points, only: [ :create, :new ]
  end

  resources :points, only: [ :show, :edit, :destroy, :index ]
  resources :user_activities, only: [:destroy, :update, :index, :edit ]

end
