# frozen_string_literal: true

class CashManagementsController < ApplicationController
  before_action :find_company, only: %i[new edit create update destroy]
  before_action :find_cash_management, only: %i[edit update destroy]
  before_action :set_months, only: %i[new edit create update]

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

  def set_months
    @date = Date.today
    @months = []
    (0..23).each do |m|
      month_value = @date.next_month(m).strftime('%B %Y')
      @months << [month_value, month_value]
    end
  end

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
