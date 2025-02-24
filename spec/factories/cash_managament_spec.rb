FactoryBot.define do
  factory :cash_management do
    association :company
    month { "January" }
    year { "2024" }
    cash_in_cents { 5_000 }
    cash_out_cents { 2_000 }
    cash_in_currency { "USD" }
    cash_out_currency { "USD" }
  end
end
