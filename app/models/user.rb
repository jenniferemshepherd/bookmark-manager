require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

# Used in the creation of a resource that has the given attributes
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :encrypted_password, String, length: 60

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(new_password)
    @password = new_password
    self.encrypted_password = BCrypt::Password.create(new_password)
  end

end
