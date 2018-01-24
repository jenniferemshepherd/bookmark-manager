require 'data_mapper'
require 'dm-postgres-adapter'

# Used in the creation of a resource that has the given attributes
class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
end

local_db = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || local_db)

DataMapper.finalize

DataMapper.auto_upgrade!
