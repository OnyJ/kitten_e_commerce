class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def update
    @cart = current_user.cart
    @item = Item.find(params[:id])
    add_quantity(@item)

    flash[:notice] = "L'article #{@item.title} a été ajouté au panier."

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end

  def destroy
    @cart = current_user.cart
    @item = Item.find(params[:id])

    sub_quantity(@item)

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end

  def remove_item
    @cart = Cart.find_by(user: current_user)
    @item = Item.find(params[:id])

    flash[:notice] = "Votre article #{@item.title} a été supprimé du panier." if @cart.items.delete(@item)

    redirect_back(fallback_location: root_path)
  end

  private

  def add_quantity(item)
    if @cart.items.include?(item)
      select_line = @cart.line_items.where(item: item)
      select_line.first.quantity += 1
      select_line.first.save
    else
      @cart.items << @item
    end

  end

  def sub_quantity(item)
    if @cart.line_items.where(item: item).first.quantity > 1
      select_line = @cart.line_items.where(item: item)
      select_line.first.quantity -= 1
      select_line.first.save
    else
      @cart.items.delete(item)
    end

  end
end
