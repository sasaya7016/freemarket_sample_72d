class CategoriesController < ApplicationController
  before_action :set_parents

  def index
    @category = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.where(category_id: @category).or(Item.where(category_id: @category.children)).or(Item.where(category_id: @category.indirects)).order(created_at: :desc).page(params[:page]).per(10)
    @parents = Category.where(ancestry: nil)
  end

  def get_toppage_category
    @category_children = Category.find(params[:parent_id]).children
  end

  def category_scroll
  end

  private
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
