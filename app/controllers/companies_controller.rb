# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy]
  before_action :auth_student!, only: %i[create update destroy]

  def index
    scope = current_user.student? ? current_user.companies : Company.all

    @companies = scope.page(params[:page]).per(10)
  end

  def new
    @company = current_user.companies.new
  end

  def edit; end

  def show
    Rails.cache.fetch("company_#{@company.id}_cash_managements", expires_in: 12.hours) do
      @cash_managements = @company.cash_managements.map { |cm| CashManagementDecorator.new(cm) }
    end
  end

  def create
    @company = CompanyCreator.new(current_user, company_params).create

    if @company
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy

    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :country, :initial_cash, :logo)
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
