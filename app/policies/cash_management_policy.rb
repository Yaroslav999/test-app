class CashManagementPolicy < ApplicationPolicy
  def create?
    user.student?
  end
end
