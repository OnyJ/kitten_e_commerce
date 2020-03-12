class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def update
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @cart.items << @item

    flash[:notice] = "L'article #{@item.title} a été ajouté au panier."

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end

  def destroy
    @cart = current_user.cart
    @item = Item.find(params[:id])
    flash[:notice] = "Votre article #{@item.title} a été supprimé du panier."
    @line_item = LineItem.find_by(cart_id: @cart.id, item_id: @item.id)
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end
end
