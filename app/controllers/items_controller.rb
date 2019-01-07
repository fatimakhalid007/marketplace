class ItemsController < ApplicationController
	before_filter:require_login
	
	def new
		@item=Item.new
	end
	
	def create
    @item=Item.new(item_params)
    if @item.save
    	flash[:success] = 'Item Added Successfully'
      redirect_to root_path, :notice => "Item Added"
    else
      render 'new'
    end
	end
	def index(category:'non')
		# @items=Item.all
		# @items=@items.sort_by{|a| a[:name]}
		if(category=='non')
		  @items = Item.paginate(page: params[:page], :per_page => 2)  
		else
			# @items = Item.paginate(page: params[:page], :per_page => 2)

		end  
	end
	def show
		@item=Item.find(params[:id])
	end
	def edit
		@item=Item.find(params[:id])
	end
  def update
    @item =Item.find(params[:id])
    if @item.update_attributes(item_params)
      if @item.update_attributes(item_params)
      	flash[:success] = "Item updated"
      	redirect_to @item
    	else
    		flash.now[:warning] = 'Enter complete information'
      	render 'edit'
    	end
  	end
	end
	def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted."
    redirect_to items_url
  end
  def electronics
  	@item =Item.where(category:'electronics')
    @items = @item.paginate(page: params[:page], :per_page => 6)
	end
	def mobiles
  	@item =Item.where(category:'mobiles')
    @items = @item.paginate(page: params[:page], :per_page => 6)
	end
	def vehicles
  	@item =Item.where(category:'vehicles')
    @items = @item.paginate(page: params[:page], :per_page => 6)
	end
	def title
  	@item =Item.all.order(:name)
     @items = @item.paginate(page: params[:page], :per_page => 6)
	end
	def price
  	 @item =Item.all.order(:price)
      @items = @item.paginate(page: params[:page], :per_page => 1)
	end
	def likes
		@item=Item.find(params[:id])
		@user_item=UserItem.new(user_id: current_user.id,item_id:@item.id)
		if @user_item.save
			respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
			flash[:success]="Item liked"
		end
	end
	def unlikes
		@user_item=UserItem.where(user_id: current_user.id , item_id: params[:id])
		# @user_item=UserItem.new(user_id: current_user.id,item_id:@item.id)
		i=@user_item.ids
	  UserItem.destroy(i[0])
		respond_to do |format|
    	format.html { redirect_to items_path }
    	format.js
			flash[:success]="Item unliked"
		end
	end
	helper_method :electronics
	helper_method:mobile
	helper_method:Vehicle
	helper_method :title
	helper_method :price
	helper_method :likes
	private
		def item_params
			params.require(:item).permit(:name,:price,:image,:Location,:description,:specification,:category,:status)
		end

end
