Rails.application.routes.draw do
  get 'project_values/create'

  get 'project_values/destroy'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'companies#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/login_employee',   to: 'sessions#new_employee'
  post   '/login_employee',   to: 'sessions#create_employee'
  delete '/logout',  to: 'sessions#destroy'
  delete '/logout_employee',  to: 'sessions#destroy_employee'
  resources :companies 
  resources :departments, only: [:new, :create, :show]
  resources :employees, only: [:new, :create, :show]
  resources :values, only: [:new, :create, :show, :index] do
    member do
      get :interview_confirm
      post :interview
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :projects, only: [:new, :create, :show]
  resources :project_values,       only: [:create, :destroy]
end
