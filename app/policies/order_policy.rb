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
end
