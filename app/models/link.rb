require 'data_mapper'
require 'dm-postgres-adapter'

# Used in the creation of a resource that has the given attributes
class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

  has n, :tags, :through => Resource
end
