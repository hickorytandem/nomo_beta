class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(buyer: user)
      # scope.where(seller: user)
    end
  end
  def show?
    record.buyer == user
  end

  def my_orders?
    # record.sellers.include?(user)
    user.restaurant
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

  def success?
    record.buyer == user
  end
end
