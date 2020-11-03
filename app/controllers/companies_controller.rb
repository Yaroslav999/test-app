# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :find_company, only: %i[show edit update destroy]

  def index
    @companies = current_user.companies
  end

  def new
    @company = current_user.companies.new
  end

  def edit; end

  def create
    @company = current_user.companies.new(company_params)

    if @company.save
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
    params.require(:company).permit(:name, :country)
  end

  def find_company
    @company = Company.find(params[:id])
  end
end