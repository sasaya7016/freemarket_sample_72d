class CategoriesController < ApplicationController

  def get_toppage_category
    @category_children = Category.find(params[:parent_id]).children
  end

end
