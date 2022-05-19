class Api::V1::PaymentIntentsController < ApplicationController
    def create
        #Create a Payment Intent with expected amount
        #amount: order.amount_cents
        #description: order.get_products_list
        #order_id: order.id
        payment_intent = Stripe::PaymentIntent.create(
            amount: 1000,
            currency: 'usd',
            payment_method: 'card',
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
            status: '',
        )
        
        #return client secret
        render json: { client_secret: payment_intent.client_secret }
        

        # data = JSON.parse(request.body.read.to_s)
    
        # begin
        # # Create the PaymentIntent
        # intent = Stripe::PaymentIntent.create({
        #     amount: 1099,
        #     currency: 'usd',
        #     payment_method: data['payment_method_id'],

        #     # A PaymentIntent can be confirmed some time after creation,
        #     # but here we want to confirm (collect payment) immediately.
        #     confirm: true,

        #     # If the payment requires any follow-up actions from the
        #     # customer, like two-factor authentication, Stripe will error
        #     # and you will need to prompt them for a new payment method.
        #     error_on_requires_action: true,
        # })
        # generate_response(intent)
        # rescue Stripe::CardError => e
        # # Display error on client
        # return [200, { error: e.message }.to_json]
        # end
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
    #             status: '',
    #         }
    #     )
    # end

    private

    def generate_response(intent)
        if intent.status == 'succeeded'
        [200, { success: true }.to_json]
        else
        # Any other status would be unexpected, so error
        [500, { error: 'Invalid PaymentIntent status' }.to_json]
        end
    end
end
