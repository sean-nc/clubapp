class TicketOptionsPolicy < ApplicationPolicy
  def index?
    current_user
  end

  def show?
    user.has_role?(:admin) || user.has_role?(:admin, record.event.venue)
  end

  def create?
    user.has_role?(:admin) || user.has_role?(:admin, record.event.venue)
  end

  def new?
    create?
  end

  def update?
    user.has_role?(:admin) || user.has_role?(:admin, record.event.venue)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?(:admin) || user.has_role?(:admin, record.event.venue)
  end
end
