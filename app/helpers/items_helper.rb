module ItemsHelper	
	def electronics
  		@item =Item.where(category:'electronics')
     	@items = @item.paginate(page: params[:page], :per_page => 6)
	end
	# helper_method :electronics
end
