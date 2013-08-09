class ApplicationController < ActionController::Base
  include Refinery::AuthenticatedSystem
  protect_from_forgery
end
