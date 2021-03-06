class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page:params[:page])
  end

  def new
  	 @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        # sign_in @user
    	  flash[:success] = "Welcome to WaterStatus!"
        redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :password,
                                   :password_confirmation)
    end

    # def signed_in_user
    #   unless signed_in? 
    #   store location
    #   redirect_to signin_url, notice: "Please sign in." unless signed_in?
    # end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
