class CredentialsController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :destroy]
  	before_action :correct_user,   only: [:edit, :update, :destroy]


	def index
		@credentials = Credential.all
	end

	def new
		@credentials = Credential.new
	end

	def create
		safe_params = params.require('credential').permit(:title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :credential_image)
  	 	@credential = Credential.new(safe_params)
	      if @credential.save
	  	     redirect_to @credential
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

  		def signed_in_user
      		redirect_to signin_url, notice: "Please sign in." unless signed_in? 
    	end

    	def correct_user
      		@user = User.find(params[:id])
      		redirect_to(root_path) unless current_user?(@user)
    	end
end

