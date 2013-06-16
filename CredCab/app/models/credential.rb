class Credential < ActiveRecord::Base
  belongs_to :user
  has_many :hours
  has_many :courses
end
