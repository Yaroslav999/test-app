# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_additional_parameters, if: :devise_controller?

  protected

  def configure_additional_parameters
    additional_params = %i[role first_name last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: additional_params)
  end

  private

  def student?
    redirect_to root_path unless current_user.student?
  end
end
