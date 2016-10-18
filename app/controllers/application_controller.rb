class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :load_sidebar

  def load_sidebar
    @jobs = Job.all
  end

  protected

    def configure_permitted_parameters
      added_attrs = [:name, :company_name]
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :company_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company_name])
    end
end
