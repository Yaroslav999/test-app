require 'rails_helper'

RSpec.describe CashManagementPolicy do
  let(:student) { create(:user, role: :student) }
  let(:teacher) { create(:user, role: :teacher) }
  let(:admin) { create(:user, role: :admin) }
  let(:cash_management) { create(:cash_management) }

  subject { described_class }

  describe '#create?' do
    it 'student abilities' do
      expect(subject.new(student, cash_management).create?).to eq(true)
    end

    it 'teacher restrictions' do
      expect(subject.new(teacher, cash_management).create?).to eq(false)
    end

    it 'admin restrictions' do
      expect(subject.new(admin, cash_management).create?).to eq(false)
    end
  end
end
