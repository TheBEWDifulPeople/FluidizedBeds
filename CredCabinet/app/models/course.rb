class Course < ActiveRecord::Base
	# validates :course, :date, :credits, presence: true
	# validates :date, length: { minimum: 4 }
	# validates :credits, :numericality => {:greater_than_or_equal_to => 1 }
	# validates :certificate, format: { with: /\A\w+.pdf\z/ }

	belongs_to :link
end
