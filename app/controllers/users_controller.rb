class UsersController < ApplicationController
  include CommonModuleForControllers
  before_action :authenticate_user!
  before_action :set_user
  before_action :reject_non_authenticate_user,only: [:show, :edit, :update]
  before_action :set_category
  before_action :user_params, only: [:update]
  before_action :user_show_info, only: [:likes ,:show ,:edit ,:update]
  def show
    
    #@sold_items = Items.where()
    #取引完了 buyer_id not null かつ buyer_id_status not null
    #取引中 buyer_id not null

  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to edit_user_path(@user.id)
    end
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

  def likes

  end
  
  def reject_non_authenticate_user
    if @user.id != current_user.id
      redirect_to user_session_path
    end
  end

  private
  def user_params
    reject = %w()
    #Modelでインクルードしたモジュールメソッドを使う(他のモデルで流用可能)
    columns = User.column_symbolized_names(reject)
    params.require(:user).permit(*columns)
  end
end