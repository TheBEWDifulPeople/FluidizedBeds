class UsersController < ApplicationController
  

  	def edit
  	end

  	def update
    	if @user.update_attributes(user_params)
      		flash[:success] = "Profile updated"
      		sign_in @user
      		redirect_to @user
    	else
      		render 'edit'
    	end
  	end
  
  	private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
