class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:given_name, :paternal_last_name, :maternal_last_name, :curp, :curp_image, :proof_of_adress_image, :address, :birth_day, :phone, :comments, :validation])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:given_name, :paternal_last_name, :maternal_last_name, :curp, :curp_image, :proof_of_adress_image, :address, :birth_day, :phone, :comments, :validation])
  end
end
