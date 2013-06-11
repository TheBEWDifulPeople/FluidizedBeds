class HomeController < ApplicationController
	skip_before_action :authenticate_user!
	skip_before_action :authorize

	before_action :reject_authenticate

  def index
  end

   private 
  def reject_authenticate
  	redirect_to credentials_path if current_user
  end
end
