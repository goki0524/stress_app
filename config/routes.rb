Rails.application.routes.draw do
  get 'project_values/create'
  get 'project_values/destroy'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/service', to: 'static_pages#service'
  get  '/privacy', to: 'static_pages#privacy'
  get  'inquiry', to: 'inquiries#index'
  post 'inquiry/confirm', to: 'inquiries#confirm'
  post 'inquiry/thanks', to: 'inquiries#thanks'
  get    '/login_company',   to: 'sessions#new_company'
  post   '/login_company',   to: 'sessions#create_company'
  get    '/login_employee',   to: 'sessions#new_employee'
  post   '/login_employee',   to: 'sessions#create_employee'
  delete '/logout_company',  to: 'sessions#destroy_company'
  delete '/logout_employee',  to: 'sessions#destroy_employee'
  
  resources :companies 
  resources :departments, only: [:new, :create, :show]
  resources :employees, only: [:new, :create, :show]
  resources :values, only: [:new, :create, :show] do
    member do
      get :interview_confirm
      post :interview
      post :send_email
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :projects, only: [:new, :create, :show]
  resources :project_values,       only: [:create, :destroy]
end
