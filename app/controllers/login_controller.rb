class LoginController < ApplicationController

  skip_before_filter :authenticate_user!
  
  def index
  	# default login screen
  end

  def authenticate
  	 
  	 @user = User.find_by_user_name_and_password(params[:user][:user_name], params[:user][:password])

     respond_to do |format|
     	 if @user
     	   session[:user_id] = @user.id
     	   format.html{ redirect_to home_path }
       else
          format.html{ redirect_to logout_path }
       end
     end
     
  end

  def logout
  	session.delete :user_id 
    redirect_to login_path
  end
  
end
