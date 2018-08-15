class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def activities?
    user == record
  end
  def create?
    user == record
  end
  def update?
    user == record
  end
end
