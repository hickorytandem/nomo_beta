class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @order = Order.all
  end

  def new
    @order = Order.new
  end

  def create
     @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end

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
