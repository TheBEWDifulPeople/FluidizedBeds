class HoursController < ApplicationController

	def index
		@credentials = current_user.credentials
		@courses = current_user.courses
		# @hours = current_user.credentials.where(credential_id = ).sum 
	end

	def show 
	end 

	def edit
	end

	def create
	end 

	def update
	end 

end
