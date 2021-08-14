class IngredientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
  end
  
  def update?
    record.seller == user
  end

  def destroy
    record.seller == user
  end
end
