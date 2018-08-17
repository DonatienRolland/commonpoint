class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def activities?
    is_user_the_owner_or_admin?
  end
  def create?
    is_user_the_owner_or_admin?
  end
  def update?
    is_user_the_owner_or_admin?
  end

  private

  def is_user_the_owner_or_admin?
    user == record || user.admin?
  end
end
