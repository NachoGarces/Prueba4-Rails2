Rails.application.routes.draw do
  get 'usertasks/create'
  root to: 'tasks#index'
  resources :tasks do
    resources :tasksusers, only: :create
  end
  resources :tasksusers, only: :index

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
