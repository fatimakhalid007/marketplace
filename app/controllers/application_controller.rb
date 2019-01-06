class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login # except: [:index:show]
  # include ItemsHelper
  # include ItemsHelper	
  private
		def not_authenticated
  		redirect_to signin_path, alert: "Please login first"
		end
end
