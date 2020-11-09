# frozen_string_literal: true

module LoginHelper
  def login_student
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create(email: 'email@email.email', password: 'test1234')
      sign_in user
    end
  end

  def login_teacher
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create(email: 'teacher@teacher.teacher', password: 'test1234', role: 'teacher')
      sign_in user
    end
  end
end