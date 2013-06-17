class HoursController < ApplicationController

	def index
		@credentials = current_user.credentials
		@courses = current_user.courses
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
