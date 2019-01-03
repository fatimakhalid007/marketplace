class UsersController < ApplicationController
	skip_before_action :require_login, only: [:index, :new, :create]
	def new
  	@user=User.new
  end
  def show
   @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
    	login(params[:user][:email], params[:user][:password])
    	flash[:success] = 'Welcome!'
      redirect_to root_path, :notice => "Signed up!"

    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update_attributes(user_params)
      if @user.update_attributes(user_params)
      	flash[:success] = "Profile updated"
      	redirect_to @user
    	else
    		flash.now[:warning] = 'E-mail and/or password is incorrect.'
      	render 'edit'
    	end
  	end
	end
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     # Handle a successful save.
  #       login(params[:user][:email], params[:user][:password])
  #       # redirect_to(:users, notice: 'User was successfully created')


  #     flash[:success] = 'Welcome!'
  #     redirect_to(:users, notice: 'User was successfully created')
  #     # redirect_to root_path
  #   else
  #     render 'new'
  #   end
  # end
  def index
     @users =User.new
  # @users = User.paginate(page: params[:page])
	end
  private
		def user_params
      params.require(:user).permit(:email,:password,:password_confirmation,:name,:contact,:avatar)
    end
end
