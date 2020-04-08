class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @user = User.where(id: @item.exhibitor_id).first
    @address = Address.where(id: @user.id).first
    @parent = @item.category
  end

  def create
    binding.pry
    @item = Item.new(item_params)
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def new
    @item = Item.new
  end
  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
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

  private

  def item_params
    #ItemModelでインクルードしたモジュールメソッドを使う(他のモデルで流用可能)
    reject = %w(category_id ,buyer_id)
    columns = Item.column_symbolized_names(reject).push(category_id: []) #category_idを配列で追加
    params.require(:item).permit(*columns)
  end

end
