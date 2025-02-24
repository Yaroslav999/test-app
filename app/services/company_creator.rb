# frozen_string_literal: true

class CompanyCreator
  def initialize(user, params)
    @user = user
    @params = params
  end

  def create
    company = Company.new(@params)
    ActiveRecord::Base.transaction do
      company.user = @user
      company.save!
      log_creation(company)
    end

    company
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Error creation: #{e.message}")
    nil
  end

  private

  def log_creation(company)
    Rails.logger.info("Company #{company.name} is created by #{@user.email}")
  end
end
