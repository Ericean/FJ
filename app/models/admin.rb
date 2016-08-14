class Admin < ActiveRecord::Base
	has_secure_password
	has_many :votes
	has_many :images, :through => :votes
end
