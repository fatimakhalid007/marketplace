class PagesController < ApplicationController
	#skip_before_filter :require_login , only:[:home]
  	def home
  	  redirect_to items_path
  	end

end
