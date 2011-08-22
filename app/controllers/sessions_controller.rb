# encoding: utf-8
class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    
    user = User.find_or_create_by_uid_and_provider(auth['uid'], auth['provider'])
    user.name = auth['user_info']['name']
    user.save
    
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Login efetuado com sucesso."
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logout efetuado com sucesso!"
  end
  
  def new
  end
  
  def failure
    redirect_to root_url, :alert => "Erro no login: #{params[:message].humanize}"
  end
end
