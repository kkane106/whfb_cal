class Tag < ActiveRecord::Base
	has_many :labels
	has_many :posts, through: :labels
end
