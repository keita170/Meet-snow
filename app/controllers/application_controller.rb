class ApplicationController < ActionController::Base
  # ストロングパラメータ
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
