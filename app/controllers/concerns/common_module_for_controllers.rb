#コントローラーの共通処理
module CommonModuleForControllers
  extend ActiveSupport::Concern

    def set_category
      @parents = Category.where(ancestry: nil).order("id ASC").limit(13)
    end
    
    def set_prefecture
      @prefecture = Prefecture.find(params[:id])
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_item
      @item = Item.find(params[:id])
    end
    
    def user_show_info
      @items = Item.where(exhibitor_id: @user)
      @evaluations = Item.where(buyer_id_status: @user)
    end
    
end