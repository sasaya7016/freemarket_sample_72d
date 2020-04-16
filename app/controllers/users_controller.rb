class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit]
  before_action :reject_non_authenticate_user
  def show

  end

  def edit

  end

  def profile
  end

  def address
  end

  def logout
  end

  def support
  end

  def registration
  end

  def defect_support
  end

  def trouble_support
  end

  def request_suppport
  end

  def evaluation_support
  end

  def buy_support
  end

  def withdraw_support
  end

  def other_support
  end
  
  private
  def reject_non_authenticate_user
    if current_user.id != @user.id
      redirect_to user_session_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end