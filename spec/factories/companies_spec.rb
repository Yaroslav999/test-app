FactoryBot.define do
  factory :company do
    association :user
    name { Faker::Company.name }
    country { Faker::Address.country }
    initial_cash_cents { rand(1000..100_000) }
    initial_cash_currency { "USD" }
    logo { nil }
  end
end
