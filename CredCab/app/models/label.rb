class Label < ActiveRecord::Base
  belongs_to :course
  belongs_to :credential
end
