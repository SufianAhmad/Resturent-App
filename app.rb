class App < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::Namespace

  get "/" do
    "Hello World.."
  end
  namespace "/orders" do
    # orders
    get do

    end

    # new orders placed by waiters
    get "/new" do
      # available dishes
      @dishes = DISHES
      haml %s(orders/new)
    end
  end
end
