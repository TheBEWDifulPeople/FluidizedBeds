class CoursesController < ApplicationController

	def index
		@courses = Course.all
		# @credentials = @courses.credentials
	end

	def new
		@courses = Course.new
	end

	def create
		safe_params = params.require('course').permit(:name, :course_date, :credits, :certificate)
  	 	@courses = Course.new(safe_params)
	      if @courses.save
	  	     redirect_to @courses
	       else
	        render 'new'
	      end
	end

	def edit
		@courses = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		@course.update(course_params)
		redirect_to @course
	end

	def show
		@course = Course.find(params[:id])
	end

	def destroy
		Course.find(params[:id]).destroy
		flash[:success] = "Course deleted"
		redirect_to courses_path
	end

	private
		def course_params
       		params.require('course').permit(:name, :course_date, :credits, :certificate)
  		end

end
