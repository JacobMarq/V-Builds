class Payment::Stripe
    data = JSON.parse(request.body.read.to_s)
    

    begin
      # Create the PaymentIntent
      intent = Stripe::PaymentIntent.create({
        amount: 1099,
        currency: 'usd',
        payment_method: data['payment_method_id'],

        # A PaymentIntent can be confirmed some time after creation,
        # but here we want to confirm (collect payment) immediately.
        confirm: true,

        # If the payment requires any follow-up actions from the
        # customer, like two-factor authentication, Stripe will error
        # and you will need to prompt them for a new payment method.
        error_on_requires_action: true,
      })
      generate_response(intent)
    rescue Stripe::CardError => e
      # Display error on client
      return [200, { error: e.message }.to_json]
    end
  end

  def generate_response(intent)
    if intent.status == 'succeeded'
      [200, { success: true }.to_json]
    else
      # Any other status would be unexpected, so error
      [500, { error: 'Invalid PaymentIntent status' }.to_json]
    end
  end
end
