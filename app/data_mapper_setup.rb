require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

require_relative 'models/tag'
require_relative 'models/link'
require_relative 'models/user'


local_db = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || local_db)

DataMapper.finalize

DataMapper.auto_upgrade!
