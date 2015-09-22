Rails.application.routes.draw do

  devise_for :users, :path_prefix => 'my', :controllers => { :registrations => "users/registrations" }

  root to: 'dashboard#index'

  mount News::Engine => "/news"
  mount Contacts::Engine => "/contacts"

  resources :users
  resources :roles
  resources :invoices do
    resources :attachments
  end
  resources :invoice_types
  resources :devices do
    resources :attachments
    resources :network_interface_cards do
      resources :network_interfaces
    end
  end
  resources :programs
  resources :documents
  resources :cpus
  resources :memory_modules

end
