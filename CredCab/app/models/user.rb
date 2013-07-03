class User < ActiveRecord::Base
	has_many :courses
	has_many :credentials
	has_many :hours

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, 
         :lockable, :timeoutable
end
