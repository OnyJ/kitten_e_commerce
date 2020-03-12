class CartsController < ApplicationController
  def show
    @cart = current_user.cart
  end

  def update
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @line_item = LineItem.create(cart_id: @cart.id, item_id: @item.id)

    flash[:notice] = "L'article #{@item.title} à été ajouté au panier."

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @line_item = LineItem.find_by(cart_id: @cart.id, item_id: @item.id)
    @line_item.destroy
    
    flash[:notice] = "Votre article #{@item.title} à été supprimé du panier." if @cart.items.delete(@item)

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end
end
