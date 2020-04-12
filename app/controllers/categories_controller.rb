class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category).or(Item.where(category_id: @category.children)).or(Item.where(category_id: @category.indirects))
    @parents = Category.where(ancestry: nil)
  end

  def get_toppage_category
    @category_children = Category.find(params[:parent_id]).children
  end

end
