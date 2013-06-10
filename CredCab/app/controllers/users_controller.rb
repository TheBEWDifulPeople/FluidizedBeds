class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
  	before_action :correct_user,   only: [:edit, :update]
  
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

    # Before filters
    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	end
end
