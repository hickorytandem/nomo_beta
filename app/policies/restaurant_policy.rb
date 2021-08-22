class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard
  end

  def new?
    create?
  end

  def create?
    true
  end

  def settings
    user.restaurant
  end
end
