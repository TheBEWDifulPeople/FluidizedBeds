class Link < ActiveRecord::Base
	attr_accessor :course_id, :crednetial_id
	has_many :courses
	has_many :credentials
end
