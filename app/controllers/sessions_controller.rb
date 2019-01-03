class SessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]
  
  def new
  end
  
  def create
  	if present(params[:session][:id])
  	@user = login(params[:session][:email], params[:session][:password])
    # redirect_back_or_to(:users, notice: 'Login successful')
		#user=login(params[:email], params[:password], params[:remember_me])
	 	#if user
	  	flash[:success] = 'Welcome back!'
	  	redirect_to root_path
		else
	  	flash.now[:warning] = 'E-mail and/or password is incorrect.'
	  	render 'new'
		end
  end

  def destroy
		logout
		flash[:success] = 'See you!'
		redirect_to signin_path
  end
  def present(e)
  	user= User.find_by(e)
    if user.email != nil
  		return true
  	else
  		return false
  	end		
  end

end
