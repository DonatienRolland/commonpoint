class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    is_user_the_owner_or_admin?
  end

  def update?
    is_user_the_owner_or_admin?
  end

  def home?
    is_user_the_owner_or_admin?
  end

  def historique?
    is_user_the_owner_or_admin?
  end

  def invitation?
    is_user_the_owner_or_admin?
  end

  def destroy?
    is_user_the_owner_or_admin?
  end

  def search_map?
    is_user_the_owner_or_admin?
  end

  def search?
    is_user_the_owner_or_admin?
  end

  def update_materiel?
    is_user_the_owner_or_admin?
  end

  def update_type_of_point?
    is_user_the_owner_or_admin?
  end

  private

  def is_user_the_owner_or_admin?
    user == record || user.admin?
  end
end
