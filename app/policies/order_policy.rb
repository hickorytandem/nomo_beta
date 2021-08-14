class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(buyer: user)
    end
  end
  def show?
    record.user == user
  end

  def new?
    true

  end

  def create?
    true
  end

  def edit?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end

  def success
    record.user
  end
end
