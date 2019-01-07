class UserItemController < ApplicationController
  # before_action :signed_in_user

  def new
  	    # @item = Item.find(params[)
  end
  def create
    #current_user.follow!(@user)
    # redirect_to @user
    # user_item.create!(user_id :current_user.id,item_id :item.id)
    # respond_to do |format|
    #   format.html { redirect_to @item }
    #   format.js
    # end
  end
  def show
  end
  # def destroy
  #   @item = UserItem.find(params[:id]).followed
  #   current_user.unlike!(@item)
  #   # redirect_to @user
  #   respond_to do |format|
  #     format.html { redirect_to @item }
  #     format.js
  #   end
  # end
 def index

 end











	 # before_action :find_item
# 	 def new
# 	 # @user_item=UserItem.new
# 	  	@item=Item.find(params[:id])
#   if @item.present?
#     @user_item = UserItem.new(user_id: current_user.id, item_id: @item.id)
#     if @user_item.save
#       redirect_to items_path, :notice => 'Liked!'
#     else
#       redirect_to items_path, :alert => 'An error prevented you from liking this post!'
#     end
#   else
#     redirect_to items_path, :alert => 'Invalid post!'
#   end
# 	 end

#   def create
#   	@item=Item.find(params[:id])
#   if @item.present?
#     @user_item = UserItem.new(user_id: current_user.id, item_id: @item.id)
#     if @user_item.save
#       redirect_to items_path, :notice => 'Liked!'
#     else
#       redirect_to items_path, :alert => 'An error prevented you from liking this post!'
#     end
#   else
#     redirect_to items_path, :alert => 'Invalid post!'
#   end
#     # @item.likes.create(user_id: current_user.id)
#     # redirect_to item_path(@item)
#     # @user_item=UserItem.new(user_item_params)
#     # @user_item.save
#   end
#   def destroy
#   	@item = Item.find(1)
#   	if @item.present?
#     	@user_item = UserItem.where(user_id: current_user.id, post_id: @post.id).first
#     if @user_item.destroy
#       redirect_to items_path, :notice => 'Unliked!'
#     else
#       redirect_to items_path, :alert => 'An error prevented you from unliking this post!'
#     end
#   	else
#     	redirect_to items_path, :alert => 'Invalid post!'
#   end
# end
#   private
#   # def find_item
#   #   @item = Item.find(params[:item_id])
#   # end
#   # def user_item_params
# 		# 	params.require(:user_item).permit(:current_user.id,:item.id)
#   # end
end