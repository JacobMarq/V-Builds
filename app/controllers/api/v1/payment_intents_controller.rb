class Api::V1::PaymentIntentsController < Api::V1::ApplicationController
    def create
        # Create a Payment Intent with expected amount
        # amount: order.amount_cents
        # description: order.get_products_list
        # order_id: order.id
        
        data = JSON.parse(request.body.read, symbolize_names: true)
        
        begin
            payment_intent = Stripe::PaymentIntent.create(
                amount: 1000,
                currency: 'usd',
                payment_method_types: ['card'],
                payment_method: 'pm_card_visa',
                receipt_email: '',
                description: 'product list',
                shipping: {
                    address: '',
                    carrier: '',
                    name: '',
                    phone: '',
                    tracking_number: '',
                },
                metadata: {
                    order_id: '1111',
                },
                # A PaymentIntent can be confirmed some time after creation,
                # but here we want to confirm (collect payment) immediately.
                confirm: true,
            )
            
            # Return client secret
            render json: {
                id: payment_intent.id,
                client_secret: payment_intent.client_secret 
                }
            
        rescue Stripe::StripeError => e
            render json: { error: { message: e.message, 
                                    code: e.code } }
        end
    end

    # Update PaymentIntent object
    # def update
    #     @payment_intent = 'temp_key'
    #     @order = 'temp_order'
    #     @user = 'user'

    #     Stripe::PaymentIntent.update(
    #         @payment_intent,
    #         {   amount: @order.amount_cents,
    #             receipt_email: @user.email,
    #             description: @order.get_products_list,
    #             shipping: {
    #                 address: '',
    #                 carrier: '',
    #                 name: '',
    #                 phone: '',
    #                 tracking_number: '',
    #             },
    #             metadata: {
    #                 order_id: @order.id,
    #             },
    #         }
    #     )
    # end

    private

    # def generate_response(intent)
    #     if intent.status == 'succeeded'
    #     [200, { success: true }.to_json]
    #     else
    #     # Any other status would be unexpected, so error
    #     [500, { error: 'Invalid PaymentIntent status' }.to_json]
    #     end
    # end

    def payment_intent_params
        params.require(:payment_intent).permit(:amount, 
                                                :currency, 
                                                :payment_method, 
                                                :receipt_email, 
                                                :description, 
                                                :shipping, 
                                                :metadata, 
                                                :confirm)
    end
end
