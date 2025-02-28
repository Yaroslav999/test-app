# frozen_string_literal: true

class CashManagementPolicy < ApplicationPolicy
  def create?
    user.student?
  end
end
