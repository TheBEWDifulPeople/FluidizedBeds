class AdminsController < ApplicationController
  
	# before_filter :authenticate_admin! 

  def index
  	@users = User.all 
  end

  def show
  end

  def edit
  end

  def update
  end
end

