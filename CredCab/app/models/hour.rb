class Hour < ActiveRecord::Base
  belongs_to :user
  belongs_to :credential
  belongs_to :course

end
