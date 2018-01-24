require 'data_mapper'
require 'dm-postgres-adapter'

desc "Updates a database"
task :update do
  DataMapper.auto_upgrade!
end

desc "migrates a database"
task :migrate do
  DataMapper.auto_migrate!
end
