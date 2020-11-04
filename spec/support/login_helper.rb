# frozen_string_literal: true

module LoginHelper
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create(email: 'email@email.email', password: 'test1234')
      sign_in user
    end
  end
end