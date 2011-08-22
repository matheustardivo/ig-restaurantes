class SessionsController < ApplicationController
  def create
    puts "request: #{request}"
    auth = request.env["omniauth.auth"]
    
    session[:user] = {
      :provider => auth['provider'],
      :uid => auth['uid'],
      :name => auth['user_info']['name']
    }
    
    redirect_to root_url, :notice => "Login efetuado com sucesso."
  end
  
  def destroy
    session[:user] = nil
    redirect_to root_url, :notice => "Logout efetuado com sucesso!"
  end
  
  def new
  end
  
  def failure
    redirect_to root_url, :alert => "Erro no login: #{params[:message].humanize}"
  end
end
