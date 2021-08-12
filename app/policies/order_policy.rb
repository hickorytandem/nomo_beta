class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
  def show?
    record.user == user
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
end
