class Course < ActiveRecord::Base
  belongs_to :user
  has_many :labels
  has_many :credentials, :through => :labels

  def credential_list
  	self.credentials.pluck(:title)
  end


  mount_uploader :certificate, CourseimageUploader

  validates :name, :course_date, :credits, presence: true
  validates :name, length: { minimum: 5, maximum: 50 }
	validates :credits, :numericality => {:greater_than_or_equal_to => 1 }
	# validates :certificate, format: { with: /\A\w+.pdf\z/ }
end


# ,  :class_name => "Course", :foreign_key => "credential_id"