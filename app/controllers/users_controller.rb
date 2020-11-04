# frozen_string_literal: true

class UsersController < ApplicationController
  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name)
  end
end
