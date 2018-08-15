class UserActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # def create?
  # end
end
