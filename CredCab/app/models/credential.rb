class Credential < ActiveRecord::Base
  belongs_to :user
  has_many :hours
  has_many :courses

	validates :title, :issuing_authority, :date_issued, :last_renewal, :next_renewal, :hoursrequired, presence: true
	validates :title, length: { minimum: 5, maximum: 50 }
	validates :hoursrequired, :numericality => {:greater_than_or_equal_to => 1 }
	# validates :credential_image, format: { with: /\A\w+.pdf\z/ }

end
