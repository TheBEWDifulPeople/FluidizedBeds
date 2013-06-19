class CredentialsController < ApplicationController


	def index
		# @credentials = Credential.all
		@credentials = current_user.credentials
	end

	def new
		# @credentials = Credential.new
		@credentials = current_user.credentials.new
	end

	def create
		safe_params = params.require('credential').permit(:title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :hoursrequired, :credential_image)
  	 	@credentials = current_user.credentials.new(safe_params)	
  	 	# @credential = Credential.new(safe_params)
	      if @credentials.save
	  	     redirect_to @credentials
	       else
	        render 'new'
	      end
	end

	def show
		@credential = Credential.find(params[:id])
	end

	def edit
		@credentials = Credential.find(params[:id])
	end

	def update
		@credentials = Credential.find(params[:id])
		@credentials.update(cred_params)
		redirect_to @credentials
	end

	def destroy
		Credential.find(params[:id]).destroy
		flash[:success] = "Credential deleted"
		redirect_to credentials_path
	end

		private
		def cred_params
       		params.require('credential').permit(:title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :hoursrequired, :credential_image)
  		end

end

