# config/routes.rb
Rails.application.routes.draw do
  resources :postulations
  resources :job_offers
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:new, :create, :show, :edit, :update]

  # Define la ruta raíz correctamente
  get '/postulantes', to: 'users#postulantes', as: 'postulantes'
  root 'users#new'
end
