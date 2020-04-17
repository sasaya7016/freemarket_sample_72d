#コントローラーの共通処理
module CommonModuleForControllers
  extend ActiveSupport::Concern

    def set_category
      @parents = Category.where(ancestry: nil).order("id ASC").limit(13)
    end
    
    def set_prefecture
      @prefecture = Prefecture.find(params[:id])
    end
    
end