class Credential < ActiveRecord::Base

	validates :title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :hoursrequired, presence: true
	validates :credential_image, presence: false
	validates :title, length: { minimum: 5, maximum: 50 }
	validates :hoursrequired, :numericality => {:greater_than_or_equal_to => 1 }
	# validates :credential_image, format: { with: /\A\w+.pdf\z/ }


	belongs_to :user
  	has_many :labels
  	has_many :courses, :through => :labels

  	mount_uploader :credential_image, CredimageUploader

	def credential_uploaded

		if credential_image presence: false
			credential.has_credential_image << false
		else
			credential.has_credential_image << true
		end

	end


end
