class CredentialsController < ApplicationController

	def index
		@credentials = Credential.all
	end

	def new
		@credentials = Credential.new
	end

	def create
		safe_params = params.require('credential').permit(:title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :credential_image)
  	 	@credentials = Credential.new(safe_params)
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
		@credential = Credential.find(params[:id])
		@credential.update(cred_params)
		redirect_to @credential
	end

	def destroy
		Credential.find(params[:id]).destroy
		flash[:success] = "Credential deleted"
		redirect_to credentials_path
	end

		private
		def cred_params
       		params.require('credential').permit(:title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :credential_image)
  		end
end


