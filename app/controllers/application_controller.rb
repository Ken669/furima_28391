class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :user_info_params, if: :devise_controller?
  before_action :store_destination, unless: :devise_or_home?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def user_info_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :nickname,
        :first_name, :last_name,
        :first_name_kana, :last_name_kana,
        :birthday
      ]
    )
  end

  def store_destination
    store_location_for(:user, request.url)
  end

  def devise_or_home?
    devise_controller? || controller_name == 'home'
  end
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
    # redirect_to this path after sign_in
  end
end
