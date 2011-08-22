# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :user_signed_in?
  
  protected
    def current_user
      session[:user]
    end
    
    def user_signed_in?
      return true if current_user
    end
    
    def authenticate_user!
      if !current_user
        redirect_to login_url, :alert => "Você precisa fazer login para acessar essa página."
      end
    end
end
