require "rails_helper"

RSpec.describe CashManagementProcessor do
  let(:company) { create(:company) }
  let(:cash_management) { create(:cash_management, company: company, cash_in_cents: 1000) }
  let(:valid_params) { { cash_in_cents: 2000, cash_out_cents: 500, month: "January", year: "2025" } }
  let(:repository) { CashManagementRepository.new }
  let(:processor) { described_class.new(repository) }

  describe "#create_cash" do
    it "creates a new cash_management" do
      expect {
        new_cash = processor.create_cash(company, valid_params)
        expect(new_cash).to be_persisted
      }.to change(CashManagement, :count).by(1)
    end
  end

  describe "#update_cash" do
    it "updates an existing cash_management" do
      processor.update_cash(cash_management, cash_in_cents: 3000)
      expect(cash_management.reload.cash_in_cents).to eq(3000)
    end
  end
end
