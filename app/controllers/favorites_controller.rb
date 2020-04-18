class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:create, :destroy]

  def create
    favorite = current_user.favorites.build(item_id: params[:item_id])
    unless favorite.save
    else
      flash.now[:alert] = favorite.errors.full_messages
    end
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    unless favorite.destroy
    else
      flash.now[:alert] = '削除できませんでした。'
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
