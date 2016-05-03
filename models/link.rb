require 'dm-migrations'
require 'dm-postgres-adapter'
require 'data_mapper'

class Link
  include DataMapper::Resource

  property :id,         Serial
  property :title,  		String
  property :url,        String
end

DataMapper.setup(:default, 'postgres://omajul:omajul@localhost/bookmark_manager_test')
DataMapper.finalize
DataMapper.auto_upgrade!