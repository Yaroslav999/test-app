# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    response = Faraday.get('https://jsonplaceholder.typicode.com/users')
    @external_users = JSON.parse(response.body, symbolize_names: true)

    @users = User.all
  end

  def edit; end

  def update
    result = ::Contracts::UserContract.new.call(user_params.to_h)

    unless result.success?
      flash.now[:error] = result.errors.to_h
      return render 'edit'
    end

    if current_user.update(result.to_h)
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email)
  end
end
