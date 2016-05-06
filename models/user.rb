require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  
  # creating a required property implies the necessity of the validation
  # so the lines below are not necessary
  # validates_presence_of :email
  # validates_format_of :email, as: :email_address

	property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, Text

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

end

# validates_confirmation_of is a DataMapper method
# provided especially for validating confirmation passwords!
# The model will not save unless both password
# and password_confirmation are the same
# read more about it in the documentation
# http://datamapper.org/docs/validations.html