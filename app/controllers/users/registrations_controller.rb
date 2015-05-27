class Users::RegistrationsController < Devise::RegistrationsController

  add_breadcrumb :index, :user_registration_path

  before_filter :check_permissions, :only => [ :new, :create , :cancel ]
  skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :create , resource
  end
end 