class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    charge = Stripe::Checkout::Session.create(
      customer_email: current_user.email,
      success_url: 'https://d0cda1c6.ngrok.io',
      cancel_url: 'https://d0cda1c6.ngrok.io',
      payment_method_types: ['card'],
      line_items: [{
        name: "Why would you buy a haunted doll",
        amount: 50000,
        currency: 'usd',
        quantity: 1
      }],
    )

    render json: {charge: charge}
  end
end
