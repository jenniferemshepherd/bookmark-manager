require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

# Used in the creation of a resource that has the given attributes
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :encrypted_password, String, length: 60

  def password=(new_password)
    self.encrypted_password = BCrypt::Password.create(new_password)
  end
end
