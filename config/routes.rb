Rails.application.routes.draw do
  root 'welcome#index'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'

  get 'sign-out', to: 'sessions#destroy'
  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'

  resources :appointments, only: [:index, :create, :show, :update]

  resources :user do
    resources :appointments, only: [:new, :edit]
  end

end
