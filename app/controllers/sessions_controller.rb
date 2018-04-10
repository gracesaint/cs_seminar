class SessionsController < ApplicationController
  def new
  end
  
  #normal create function
  
   def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end
  
  
  
  #merchant function from website
  
#  def create
#    @user = User.find_or_create_by(auth :request.env["omniauth.auth"])
#    session[:user_id] = @user.id
#    load_order
#    @order.update_attributes(user: @user)
#    redirect_to products_path, notice: "Logged in as #{@user.name}"
#  end

  
  def destroy
    log_out
    session[:user_id] = nil
    redirect_to root_url, notice: "Goodbye!"
  end
  
end
