class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @orders = current_user.orders
  end

  def new
  end

  def create
    @amount = current_user.cart.total_price.to_i * 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Confirmation de la commande" ,
      currency: 'eur',
    })

    @order = Order.create(user_id: current_user.id, amount: @amount)
    current_user.cart.line_items.each do |line_item|
      OrderItem.create(order_id: @order.id, item_id: line_item.item.id, quantity: line_item.quantity)
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path(current_user.cart)

    if @order.save
      empty_cart
      flash[:notice] = "Your order was successfully taken"
      redirect_to root_path
    else
      redirect_to cart_path(current_user.cart)
    end
  end

  def empty_cart
    current_user.cart.line_items.each(&:destroy)
  end
end
