env = ENV["RACK_ENV"]
url = Dir.pwd + "/db/#{env}"
DataMapper.setup :defualt, "sqlite://#{url}/sqlite3"

class Orders
  include DataMapper::Resource
  property :id, Serial
  property :client, String
  has_n :order_items
end

class OrderItem
  include DataMapper::Resource
  property :id, Serial
  property :dish_id, Integer
  belongs_to :order
end

DataMapper.finalize
DataMapper.auto_upgrade!
