class ApplicationController < ActionController::Base
  include Refinery::AuthenticatedSystem
  protect_from_forgery
  #before_filter :authenticate

 #def authenticate
  #unless Kreaideasuser.find_by_id(session[:user_id])
  #	redirect_to login_url, notice: "Inicie Sesión"
  #end


 # end
end
