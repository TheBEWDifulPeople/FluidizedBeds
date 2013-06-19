class CoursesController < ApplicationController

	def index
		# @courses = Course.all
		# @credentials = find_cred_title
		@courses = current_user.courses
		# @credentials = current_user.credentials
	end

	def new
		# @courses = Course.new
		@courses = current_user.courses.new
		# @credentials = Credential.all
		@credentials = current_user.credentials
	end

	def create
		safe_params = params.require('course').permit(:name, :course_date, :credits, :certificate, :credential_id)
  	 	@courses = current_user.courses.new(safe_params)
  	 	# course.credential_id = params[:credential_id]
  	 	@credential = Credential.find_by(params[:credential_id])
  	 	@courses.credentials << @credential
  	 	# @courses = Course.new(safe_params)
	      if @courses.save
	  	     redirect_to @courses
	       else
	       	@credentials = Credential.all
	        render 'new'
	      end
	end

	def edit
		@courses = Course.find(params[:id])
		@credentials = current_user.credentials
	end

	def update
		@courses = Course.find(params[:id])
		@courses.update(course_params)
		@credential = Credential.find_by(params[:credential_id])
  	 	@courses.credentials << @credential
		redirect_to @courses
	end

	def show
		@course = Course.find(params[:id])
		# @credential = Course.find(params[:id])
	end

	def destroy
		Course.find(params[:id]).destroy
		flash[:success] = "Course deleted"
		redirect_to courses_path
	end

	private
		def course_params
       		params.require('course').permit(:name, :course_date, :credits, :certificate, :credential_id)
  		end

  		def find_cred_title
  			params.each do |id, title|
  				if id =~/(.+)_id$/
  					return $1.classify.constantize.find(title)
  				end 
  			end
  			nil
  		end

end

# course.credentials << @credential
