require 'data_mapper'
require 'dm-postgres-adapter'

# Used in the creation of a resource that has the given attributes
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String

end
