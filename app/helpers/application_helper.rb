# frozen_string_literal: true

module ApplicationHelper
  def months_for_company(company)
    date = company.created_at.to_date
    months = []
    (0..23).each do |m|
      month_value = date.next_month(m).strftime('%B %Y')
      months << [month_value, month_value]
    end
    months
  end
end
