class Api::V1::OrdersController < Api::V1::ApplicationController
  before_action :set_order, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /orders
  def index
    @orders = Order.find(user_id: current_user.id)
    
    render json: @orders
  end

  # POST /orders
  def create
    @order = nil
    @order_items = {}
    #Check which type of order it is
    if order_params[:payment_gateway] == "stripe"
      prepare_new_order
    elsif order_params[:payment_gateway] == "paypal"
      #PAYPAL WILL BE HANDLED HERE
    end
  ensure
    if @order.save
      for order_item in @order_items do
        order_item.save
      end
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Initialize a new order and and set its user, product and price.
    def prepare_new_order
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      shopping_session = ShoppingSession.last!(user_id: @order.user_id)
      @order.price_cents = shopping_session.total_cents

      cart_items = CartItem.find(shopping_session_id: shopping_session.id)
      for cart_item in cart_items do
        order_item = OrderItem.new(order_id: @order.id, build_id: cart_item.build_id)
        @order_items << order_item
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:users_id, :amount_cents, :payment_gateway, :charge_id)
    end
end
