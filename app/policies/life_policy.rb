class LifePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user_as_owner_or_admin?
  end


  def destroy?
    user_as_owner_or_admin?
  end

  def update?
    user_as_owner_or_admin?
  end

  private

  def user_as_owner_or_admin?
    user == record.user || user.admin
  end

end
