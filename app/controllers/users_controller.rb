class UsersController < ApplicationController
  include CommonModuleForControllers
  before_action :authenticate_user!
  before_action :set_user
  before_action :reject_non_authenticate_user,only: [:show, :edit, :update]
  before_action :set_category
  before_action :user_params, only: [:update]
  before_action :user_show_info, only: [:selling,:sold , 
  :sell_transaction, :buy_transaction,
  :bought  ,:likes ,:show ,:edit ,:update]
  before_action :items_status
  
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
    #過去@user.id全ての出品した商品
    @total_sold_items = Item.where(exhibitor_id: @user.id)
    #過去@user.id出品した商品のうち、現在出品中の商品
    @selling_items = @total_sold_items.where(buyer_id: nil)
    #@user.id出品して売れた商品のうち、取引中のもの
    @sold_transaction_items = @selling_items.where(buyer_id_status: nil)
    #@user.id出品して売れた商品が取引終了したもの
    @sold_transaction_end_items = @sold_transaction_items.where.not(buyer_id_status: nil)

    #過去@user.idが購入した全ての購入済み商品
    @total_bought_items = Item.where(buyer_id: @user.id)
      #過去全ての購入済み商品のうち取引中の商品
    @bought_transaction_items = @total_bought_items.where(buyer_id_status: nil)
      #@user.idが過去に購入した商品のうち取引が完了した商品
    @bought_transaction_end_items = @bought_transaction_items.where.not(buyer_id_status: nil)
  private
  def user_params
    reject = %w()
    #Modelでインクルードしたモジュールメソッドを使う(他のモデルで流用可能)
    columns = User.column_symbolized_names(reject)
    params.require(:user).permit(*columns)
  end
end