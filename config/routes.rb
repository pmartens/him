Rails.application.routes.draw do

  devise_for :users, :path_prefix => 'my', :controllers => { :registrations => "users/registrations" }

  root to: 'dashboard#index'

  mount News::Engine => "/news"

  resources :users
  resources :roles
  resources :devices do
    resources :documents
    resources :network_interface_cards do
      resources :network_interfaces
    end
  end
  resources :programs
  resources :cpus
  resources :memory_modules

end
