require 'rails_helper'

RSpec.describe UpdateCashManagementJob, type: :job do
  include ActiveJob::TestHelper
  let!(:cash_management) { create(:cash_management, cash_in_cents: 1000, monthly_increase_cents: 200) }

  it "add tests to the queue" do
    expect {
      UpdateCashManagementJob.perform_later
    }.to have_enqueued_job(UpdateCashManagementJob).exactly(1).times
  end

  it "run in the default queue" do
    expect(described_class.queue_name).to eq('default')
  end

  it "update cash_management after run" do
    expect {
      perform_enqueued_jobs { UpdateCashManagementJob.perform_later }
    }.to change { cash_management.reload.cash_in_cents }.by(200)
  end

  it "run and update data" do
    expect(cash_management.cash_in_cents).to eq(1000)
    UpdateCashManagementJob.perform_now
    expect(cash_management.reload.cash_in_cents).to eq(1200)
  end
end
