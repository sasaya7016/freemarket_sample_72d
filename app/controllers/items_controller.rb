class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit, :destroy]

  def move_to_index
    if !user_signed_in?
      redirect_to root_path
    elsif current_user.id!=exhibitor_id
        redirect_to root_path
      end
  end
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @user = User.where(id: @item.exhibitor.id).first
    @address = Address.where(id: @user.id).first
  end


  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def new
  end

end
