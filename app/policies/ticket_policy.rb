class TicketPolicy < ApplicationPolicy
  def index?
    user.has_role?(:admin) || user.has_role?(:admin, record) || user.has_role?(:employee, record)
  end

  def show?
    user.has_role?(:admin) || user.has_role?(:admin, record) || user.has_role?(:employee, record)
  end
end
