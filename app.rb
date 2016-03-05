class App < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::Namespace
  helpers Sinatra::JSON

  get "/" do
    "Hello World.."
  end
  namespace "/orders" do
    # orders list for cook
    get do
      @orders = Order.all
      @dishes = DISHES
      haml %s(orders/index)
    end

    # new orders placed by waiters
    get "/new" do
      # available dishes
      @dishes = DISHES
      haml %s(orders/new)
    end

    # post orders
    post do
      # binding.pry
      @order = Order.create! params[:order]
      params[:dishes].each do |dish|
        OrderItem.create! order_id: @order.id, dish_id: dish
      end

      flash[:notice] = "Thanks for placing order."
      redirect "/orders/new"
    end

    post "/:id.json" do |id|
      @order = Order.get id
      @order.update done: params[:done]
      json message: "Order successfully updated.."
    end

  end
end
