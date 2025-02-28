# frozen_string_literal: true

class CashManagementsController < ApplicationController
  before_action :find_company, only: %i[new edit create update destroy]
  before_action :find_cash_management, only: %i[edit update destroy]
  before_action :auth_student!, only: %i[create update destroy]

  def initialize
    super
    @cash_management_processor = CashManagementProcessor.new(CashManagementRepository.new)
  end

  def new
    @cash_management = @company.cash_managements.new
  end

  def edit; end

  def create
    @cash_management = @cash_management_processor.create_cash(@company, cash_params)

    if @cash_management
      redirect_to @company, notice: 'Cash management created successfully'
    else
      render 'new'
    end
  end

  def update
    if @cash_management_processor.update_cash(@cash_management, cash_params)
      redirect_to @company, notice: 'Cash management updated successfully'
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
    permit_params = params.require(:cash_management).permit(:month, :cash_in, :cash_out)
    month_params = permit_params.delete(:month).split(' ')
    permit_params.merge({ month: month_params.first, year: month_params.last })
  end

  def find_cash_management
    @cash_management = @company.cash_managements.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
  end
end
