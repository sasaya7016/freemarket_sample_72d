class ItemsController < ApplicationController
  before_action :set_item , only: [:show, :buy, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :not_buy, only: [:buy]

  def index
  end
  
  def show
    @user = User.where(id: @item.exhibitor.id).first
    @address = Address.where(id: @user.id).first
  end
  
  
  def create
  end
  
  def edit
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show, alert: '削除に失敗しました。'
    end
  end
  
  def update
  end
  
  def new
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def not_buy
    if current_user.id == @item.exhibitor_id
      redirect_to root_path
    end
    end
  
  def move_to_index
    if !user_signed_in?
      redirect_to root_path
    elsif current_user.id!=@item.exhibitor_id
        redirect_to root_path
      end
  end
end
