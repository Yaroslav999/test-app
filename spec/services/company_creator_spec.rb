require 'rails_helper'

RSpec.describe CompanyCreator, type: :service do
  let(:user) { create(:user) }
  let(:valid_params) { { name: "Test Company", country: "USA", initial_cash: 500} }
  let(:invalid_params) { { name: "", country: "USA" } }

  describe "#create" do
    context "correct params" do
      it "company created" do
        service = CompanyCreator.new(user, valid_params)
        company = service.create

        expect(company.user).to eq user
      end
    end

    context "incorrect params" do
      it "return nil" do
        service = CompanyCreator.new(user, invalid_params)
        company = service.create

        expect(company).to be_nil
      end
    end
  end
end
