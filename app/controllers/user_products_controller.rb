class UserProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items_in_cart = current_user.products_in_cart
  end

  def create
    carted_item = UserProduct.new(
                                  product_id: params[:product_id],
                                  user_id: current_user.id,
                                  removed_from_cart: false
      )

    if carted_item.save
      flash[:success] = "Added to cart, good luck"
      redirect_to "/products"
    else
      flash[:error] = "Yikes bro"
      redirect_to "/products"
    end
  end

  def remove
    item_in_cart = UserProduct.find(params[:id])
    item_in_cart.update(removed_from_cart: true)
    flash[:success] = "You changed your mind while you still could."
    redirect_to "/cart"
  end


end
