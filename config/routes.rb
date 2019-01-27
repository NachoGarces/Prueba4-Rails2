Rails.application.routes.draw do
  get 'usertasks/create'
  root to: 'tasks#index'
  resources :tasks do
    resources :tasksusers, only: [:create, :update]
  end
  resources :tasksusers, only: :index

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
