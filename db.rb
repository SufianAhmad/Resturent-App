env = ENV["RACK_ENV"] || "development"
url = "sqlite://#{Dir.pwd}/db/#{env}.sqlite3"
DataMapper.setup :default, url

class Order
  include DataMapper::Resource
  property :id, Serial
  property :client, String

  has n, :order_items
end

class OrderItem
  include DataMapper::Resource
  property :id, Serial
  property :dish_id, Integer
  
  belongs_to :order
end

DataMapper.finalize
DataMapper.auto_upgrade!
