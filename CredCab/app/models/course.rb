class Course < ActiveRecord::Base
  belongs_to :user
  has_many :credentials 


  def credential_list
  	self.credentials.pluck(:title)
  end

  	validates :name, :course_date, :credits, presence: true
  	validates :name, length: { minimum: 5, maximum: 50 }
	validates :credits, :numericality => {:greater_than_or_equal_to => 1 }
	validates :certificate, format: { with: /\A\w+.pdf\z/ }
end
