class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:admin) || user.has_role?(:admin, record.venue)
  end

  def new?
    create?
  end

  def update?
    user.has_role?(:admin) || user.has_role?(:admin, record.venue)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?(:admin) || user.has_role?(:admin, record.venue)
  end
end