class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to main_app.root_url, :alert => exception.message
    if current_user.nil?
      session[:next] = request.fullpath
      puts session[:next]
      redirect_to new_user_session_path, :alert => 'You have to log in to continue.'
    else
      if request.env['HTTP_REFERER'].present?
        redirect_to :back, :alert => exception.message
      else
        redirect_to root_url, :alert => exception.message
      end
    end
  end
end
