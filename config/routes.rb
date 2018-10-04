Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :update, :edit] do
    resources :user_activities, only: [ :create, :new ] do
      get 'search', on: :collection
    end
    resources :points, only: [ :create, :new ] do
      get 'home', :on => :collection
      get 'historique', on: :collection #without id
      get 'invitation', on: :collection
    end
  end

  resources :equipments, only: :update
  resources :participants, only: :update
  resources :points, only: [ :show, :edit, :destroy, :index, :update ] do
    put 'search_map', on: :member #with id
    put 'update_type_of_point', on: :member #with id
    resources :messages, only: [ :create ]
    resources :participants, only: :create
  end
  resources :point_groups, only: :show

  resources :messages, only: :destroy
  resources :user_activities, only: [:destroy, :update, :index, :edit ]

end
