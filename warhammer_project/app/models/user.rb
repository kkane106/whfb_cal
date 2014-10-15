# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end

class User < ActiveRecord::Base
 	# include BCrypt
	# validates :email, uniqueness: true
 #  validates :email, presence: true, email: true
 #  validates :name, :password_digest, presence: true

  has_many :comments
  has_many :posts

	has_secure_password

end
