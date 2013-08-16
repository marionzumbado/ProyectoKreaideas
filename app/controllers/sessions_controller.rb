class SessionsController < ApplicationController
  def new
  end

  def create
  	if user=Kreaideasuser.authenticate(params[:name],params[:password])
  		session[:user_id]=user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Usuario o contraseña incorrecta"
  	end

  end

  def destroy
  	session[:user_id] = nil
	redirect_to login_url, :notice => "Sesión cerrada "
  end
end
