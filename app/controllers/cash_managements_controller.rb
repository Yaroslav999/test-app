# frozen_string_literal: true

class CashManagementsController < ApplicationController
  before_action :find_company, only: %i[edit create update destroy]
  before_action :find_cash_management, only: %i[edit update destroy]

  def new
    @cash_management = @company.cash_managements.new
  end

  def edit; end

  def create
    @cash_management = @company.cash_managements.new(cash_params)

    if @cash_management.save
      redirect_to @company
    else
      render 'new'
    end
  end

  def update
    if @cash_management.update(cash_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @cash_management.destroy

    redirect_to @company
  end

  private

  def cash_params
    params.require(:cash_management).permit(:year, :month, :cash_in, :cash_out)
  end

  def find_cash_management
    @cash_management = @company.cash_managements.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
