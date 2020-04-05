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
    # 初期値代入・カテゴリー1つ目
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

  def get_item_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}")
    if related_size_parent = selected_grandchild.item_sizes[0]
       @item_sizes = related_size_parent.children
    else
       selected_child = Category.find("#{params[:grandchild_id]}").parent
       if related_size_parent = selected_child.item_sizes[0]
          @item_sizes = related_size_parent.children
       end
    end
 end
end
