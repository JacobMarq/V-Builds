class Api::V1::OrdersController < Api::V1::ApplicationController
  before_action :set_order, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /orders
  def index
    @orders = Order.find(user_id: current_user.id)
    
    render json: @orders
  end

  def submit
    @order = nil
    @order_items = {}
    #Check which type of order it is
    if order_params[:payment_gateway] == "stripe"
      prepare_new_order
      Orders::Stripe.execute(order: @order, user: current_user)
    elsif order_params[:payment_gateway] == "paypal"
      #PAYPAL WILL BE HANDLED HERE
    end
  ensure
    if @order&.save
      for order_item in @order_items do
        order_item.save
      end

      if @order.paid?
        # Success is rendered when order is paid and saved
        return render html: SUCCESS_MESSAGE
      elsif @order.failed? && !@order.error_message.blank?
        # Render error only if order failed and there is an error_message
        return render html: @order.error_message
      end
    end
    render html: FAILURE_MESSAGE
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  # def create
  #   @order = Order.new(order_params)

  #   if @order.save
  #     render json: @order, status: :created, location: @order
  #   else
  #     render json: @order.errors, status: :unprocessable_entity
  #   end
  # end

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
      # prepare_order_description
    end

    # # Gather information to create order description
    # def prepare_order_description
    #   for order_item in @order_items do
    #     build = Build.find(build_id: order_item.build_id)
    #     @components = build.components
    #     @order_description = create_description(@components)
    #   end
    # end

    # # Create order description
    # def create_description
    #   temp_desc = nil
    #   for component in @components do
    #     temp_desc << component.model + " "
    #   end
    # end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:users_id, :token, 
:amount_cents, :payment_gateway, :charge_id)
    end
end
