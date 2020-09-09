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
    user == record.user
  end

end

# a policy file is meant to PROTECT its own controller
# in this case the life_policy.rb is meant to protect the lives_controller.rb
# the ROUTINE/FLOW will be the following, let's tale as example the def CREATE method of a life
# POLICY file comes FIRST (Who can create a lfe?)
# >> def create? true end
# CONTROLLER file is the SECOND (do we authorize it?)
#>> def create authorize @life end
# VIEW file is the last one...i.e. we update the ROUTING of the VIEW inside the controller
#....i.e we make sure that the routing is KNWON to the controller, so that we don't get any MISSING PATH error.
# if @life.save!
#   redirect_to life_path(@life)
# else
#   render :new
# end
