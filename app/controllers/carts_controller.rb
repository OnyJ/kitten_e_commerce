class CartsController < ApplicationController
  def show
    @cart = current_user.cart
  end

  def update
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @cart.items << @item

    flash[:notice] = "L'article #{@item.title} à été ajouté au panier."

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @item.destroy

    flash[:notice] = "Votre article #{@item.title} à été supprimé du panier." if @cart.items.delete(@item)

    redirect_back(fallback_location: root_path)
  end
end
