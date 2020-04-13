class ItemsController < ApplicationController
  before_action :set_item , only: [:show, :buy, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :not_buy, only: [:buy]

  def index
  end
  
  def show
    @item_images = @item.item_images
    @user = User.where(id: @item.exhibitor_id).first
    @address = Address.where(id: @user.id).first
    @parent = @item.category
  end
  
  
  def create
    if params[:item][:item_images_attributes] != nil?
      @item = Item.new(item_params.merge(exhibitor_id: 1))
      #deviseが未実装でcurrent_userが未定義のため仮にid:1を代入
      @category = Category.where(ancestry: nil).order("id ASC").limit(13)
        if @item.save
          redirect_to root_path
        else
          redirect_to new_item_path, alert: '商品の出品に失敗しました'
        end
    else
      redirect_to new_item_path, alert: 'ERROR'
    end
  end
  
  def edit
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show, alert: '削除に失敗しました。'
    end
  end
  
  def update
  end
  
  def new
    @item = Item.new
    @item.item_images.new
    @category = Category.where(ancestry: nil).order("id ASC").limit(13)
    
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
  
  def category_index
  end

  
  def profits
    @price = params[:item][:price].to_i
    @profits = @price * 0.9.to_i
    @place_fee = @price * 0.1.to_i
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def not_buy
    if current_user.id == @item.exhibitor_id
      redirect_to root_path
    end
  end
  
  def move_to_index
    if !user_signed_in?
      redirect_to root_path
    elsif current_user.id!=@item.exhibitor_id
        redirect_to root_path
    end
  end

  def item_params
    #ItemModelでインクルードしたモジュールメソッドを使う(他のモデルで流用可能)
    reject = %w(buyer_id)
    columns = Item.column_symbolized_names(reject).push(item_images_attributes: [ :id ,:image ,:_destroy])
    params.require(:item).permit(*columns)
  end


end
