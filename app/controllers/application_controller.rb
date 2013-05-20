class ApplicationController < ActionController::Base
  #protect_from_forgery
#skip_authorization_check :only => [:new, :create]
    #rescue_from CanCan::AccessDenied do |exception|
   # redirect_to root_url, :alert => exception.message
 # end
 
  
end
