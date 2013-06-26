class Course < ActiveRecord::Base
  belongs_to :user
  has_many :labels
  has_many :credentials, :through => :labels

  def label_list
  	self.credentials.pluck(:title)
  end

  def label_list=(labels)
    labels.each do |label|
      self.credentials << current_user.credentials.where(params[:id], label)
    end
  end


  # def sum_credits

  #   if credentials.title == courses.label_list
  #     hours << courses.credits
  #     hours.sum 

  #     else 
  #       nil 
  #   end

  # end


  mount_uploader :certificate, CourseimageUploader

  validates :name, :course_date, :credits, presence: true
  validates :name, length: { minimum: 5, maximum: 50 }
	validates :credits, :numericality => {:greater_than_or_equal_to => 1 }
	# validates :certificate, format: { with: /\A\w+.pdf\z/ }
end


