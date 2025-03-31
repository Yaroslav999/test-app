# frozen_string_literal: true

module Contracts
  class UserContract < Dry::Validation::Contract
    params do
      required(:first_name).filled(:string)
      required(:last_name).filled(:string)
      required(:email).filled(:string, format?: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end
  end
end
