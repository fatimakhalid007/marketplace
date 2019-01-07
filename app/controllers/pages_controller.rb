class PagesController < ApplicationController
	#skip_before_filter :require_login , only:[:home]
  	def home
  	  redirect_to items_path
  	end
  	def search
  		if params[:search].blank?  
    		redirect_to(root_path, alert: "Empty field!") and return  
  		else  
    		@parameter = params[:search].downcase  
    		# @results = Store.all.where("lower(name) LIKE :search", search: @parameter)  
    		@results = Item.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
  		end 
  	end

end
