class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @orders = current_user.orders
  end
end
