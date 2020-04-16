class FavoritesController < ApplicationController
  before_action :set_variables

  def create
    favorite = current_user.favorites.new(item_id: @item.id)
    favorite.save
  end

  def destroy
    favorite = current_user.favorites.find_by(item_id: @item.id)
    favorite.destroy
  end

  def show
  end

  private

  def set_variables
    @item = Item.find(params[:story_id])
    @id_name = "#like-link-#{@story.id}"
  end

end
