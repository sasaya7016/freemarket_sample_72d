class ItemsController < ApplicationController
  def index
  end

  def show
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
    # 
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  # 後にAjaxで使うアクション
  def get_category_children
    # parentからchildrenを指定
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    # childrenからgrandchildrenを指定
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
end
