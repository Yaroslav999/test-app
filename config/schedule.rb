every :day, at: '11:59pm' do
  runner "UpdateCashManagementJob.perform_later if Date.tomorrow.day == 1"
end
