class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user! 
  
  # before_filter :authorize 



  #   def authorize
  #     @user = User.find(params[:id])
  #     redirect_to(root_path) unless current_user?(@user)
  #   end



  # def authorize
  #   if current_user == @user 
  #     redirect_to root_path

  #   else 



  # end



  # def current_user?(user)
  #     user == current_user
  #   end

  # before_action :signed_in_user, only: [:edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update, :destroy]

  # # def signed_in_user
  #     redirect_to signin_path, notice: "Please sign in to your account or signup." unless signed_in?
  #  end

  #   def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to(root_path) unless current_user?(@user)
  #   end

end
