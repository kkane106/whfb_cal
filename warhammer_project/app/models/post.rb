class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	has_many :labels
	has_many :tags, through: :labels
end
