class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include TheRole::Controller

  before_filter :authenticate_user!
  
  def access_denied
    flash[:alert] = t('the_role.access_denied')
    redirect_to(:back)
  end
  
  
end
