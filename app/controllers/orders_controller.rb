class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = policy_scope(Order)
    @collected_orders = @orders.where(status: "collected")
    @not_collected_orders = @orders.where(status: "not collected")
    @my_orders = []

    Order.where(buyer: current_user).each do |order|
      order.ingredients.each do |ingredient|
        @my_orders << ingredient.stock_amount
      end
    end
    @my_ingredients = @my_orders.sum
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
