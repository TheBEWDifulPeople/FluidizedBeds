class HoursController < ApplicationController

	def index
		@credentials = Credential.all
		@courses = Course.all
		# @course = Course.find(params[:credits])
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
