class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def accept?
    true
  end

  def decline?
    true
  end

  def cancel?
    true
  end
end
