class UsersController < ApplicationController
  include CommonModuleForControllers
  before_action :authenticate_user!
  before_action :set_user
  before_action :reject_non_authenticate_user,only: [:show, :edit, :update , :delete]
  before_action :set_category
  before_action :user_params, only: [:update]
  before_action :user_show_info, only: [:selling,:sold , 
  :sell_transaction, :buy_transaction,
  :bought  ,:likes ,:show ,:edit ,:update]
  before_action :items_status
  
  def destroy
    @user.destroy
    redirect_to root_path
  end

  def show
  end

  def selling
  end

  def sold
  end

  def sell_transaction
  end

  def buy_transaction
  end

  def bought
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

  def items_status
    @total_sold_items = Item.where(exhibitor_id: @user.id)
    @selling_items = Item.where(exhibitor_id: @user.id , purchaser_id: nil)
    @sold_transaction_items = Item.where(exhibitor_id: @user.id, purchaser_id_status: nil).where.not(purchaser_id: nil)
    @sold_transaction_end_items = Item.where(exhibitor_id: @user.id,).where.not(purchaser_id: nil , purchaser_id_status: nil)
    
    @total_bought_items = Item.where(purchaser_id: @user.id)
    @bought_transaction_items = Item.where(purchaser_id: @user.id , purchaser_id_status: nil)
    @bought_transaction_end_items = Item.where(purchaser_id: @user.id ).where.not(purchaser_id_status: nil)
    
  end

  private
  def user_params
    reject = %w()
    #Modelでインクルードしたモジュールメソッドを使う(他のモデルで流用可能)
    columns = User.column_symbolized_names(reject)
    params.require(:user).permit(*columns)
  end
end