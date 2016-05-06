require_relative './models/tag'
require_relative './models/link'
require_relative './models/user'

p ENV['RACK_ENV']

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize