class ItemsController < ApplicationController
  # before_action :set_item , only: [:show, :buy, :edit, :destroy]
  # before_action :move_to_index, only: [:edit, :destroy]
  # before_action :not_buy, only: [:buy]

  def index
  end
  
  def show
    @user = User.where(id: @item.exhibitor.id).first
    @address = Address.where(id: @user.id).first
  end
  
  
  def create
  end
  
  def edit
    @item = Item.find(params[:id])
    # @user = User.where(id: @item.exhibitor_id).first
    # @address = Address.where(id: @user.id).first
  end
  
  def destroy
  end
  
  def update
    @item = Item.find(params[:id])
    # @user = User.where(id: @item.exhibitor_id).first
    # @address = Address.where(id: @user.id).first
    if @item.update(item_params) 
      redirect_to edit_item_path(@item)
    else
      render :edit
    end
  end
  
  def new
  end


  private
#   def set_item
#     # @item = Item.find(params[:id])
#   end
  
#   def not_buy
#     if current_user.id == @item.exhibitor_id
#       redirect_to root_path
#     end
#     end
  
#   def move_to_index
#     if !user_signed_in?
#       redirect_to root_path
#     elsif current_user.id!=@item.exhibitor_id
#         redirect_to root_path
#       end
#   end

  def item_params
    params.require(:item).permit(:name,:introduction,:brand,:status,:delivery_fee,:preparation_day,:price)
  end

  def address_params
    params.require(:address).permit(:prefecture)
  end 

end
