class CoursesController < ApplicationController

	def index
		# @courses = Course.all
		# @credentials = find_cred_title
		@courses = current_user.courses
		@credentials = current_user.credentials
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
  	 	
  	 	# @credential = current_user.credentials.where(:credential_id, :id )
  	 	# @courses.credentials << @credential

  	 	# current_user.credentials.where(params[:course_id], params[:credential_id])
  	 	# @credential = Credential.find_by(params[:credential_id])
  	 	# Credential.where(:credential_id, :title)
  	 	# course.credential_id = params[:credential_id]
  	 	# @courses = Course.new(safe_params)
	      if @courses.save
	  	     redirect_to @courses
	       else
	       	@credentials = current_user.credentials
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
       		params.require('course').permit(:name, :course_date, :credits, :certificate, :credential_id, :label_list)
  		end

end

