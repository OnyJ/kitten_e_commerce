class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_privileges!, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show
    @orders = current_user.orders
  end

  private 

  def check_privileges!
    redirect_to root_path, notice: "You dont have enough permissions" unless current_user == Profile.find(params[:id]).user
  end
end
