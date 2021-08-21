class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(buyer: user)
    end
  end
  def show?
    record.user == user
  end

  def my_orders?
    true
    # restaurant id in order == current_user.restaurant
  end

  def new?
    true
  end

  def update?
    true
  end

  def create?
    record.user == user
  end

  def edit?
    user
  end

  def destroy?
    user
  end

  def success
    record.user
  end
end
