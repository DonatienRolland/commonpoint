class UserActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope
      if user
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def index?
    true
  end

  def update?
    user == record.user
  end
  def destroy?
    user == record.user
  end
end
