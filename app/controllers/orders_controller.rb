class OrdersController < ApplicationController
  before_action :find_order, only: [ :show, :edit, :update, :destroy]

  def index
    @orders = policy_scope(Order)

  end

  def new

  end

  def create

  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total_price, :pay_method, :status)
  end
end
