class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_location
  layout :layout_by_resource
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end


  # Redirect to page where the user was visiting
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end


  protected

  def after_sign_in_path_for(resource)
    user_root_path  #session[:previous_url] || root_path
  end

  def after_update_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
  
  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    else
      I18n.locale = extract_locale_from_accept_language_header
    end
  end

  def extract_locale_from_accept_language_header
    return I18n.default_locale if request.env['HTTP_ACCEPT_LANGUAGE'].blank?
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      when 'en'
        'en'
      when 'fr'
        'fr'
      when 'es'
        'es'
      when 'pt'
        'pt'
      else
        I18n.default_locale
    end
  end
end
