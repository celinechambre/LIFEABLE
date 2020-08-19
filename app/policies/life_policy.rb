class LifePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
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
