class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  private

  def user_params
    params.require(:user).permit(:address, :name, :phone_number, :name, :card_detail, :restaurant_id)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
