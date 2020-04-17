#モデルの共通処理
module Common_Module
  extend ActiveSupport::Concern

  module ItemsShowMethods
    def previous
      Item.where('id < ?',self.id).order('id DESC').first
    end

    def next
      Item.where('id > ?', self.id).order('id ASC').first
    end
  end

  module ClassMethods
    #カラム名のシンボル型を配列で定義
    def column_symbolized_names(reject=[])
      column_names.delete_if{|n| n.in?(reject)}.map(&:to_sym)
    end
  end
  
end