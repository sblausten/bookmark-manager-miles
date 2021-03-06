require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/link'
require_relative './models/tag'
require_relative './models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}" )
# postgres://jfokbvgailmvzb:098fb4386bac8031b76cb58d8e9b52a3d957092100effe4f8790ee3bccf80d07@ec2-23-21-235-142.compute-1.amazonaws.com:5432/d4b201ltlpmn9c
DataMapper.finalize
