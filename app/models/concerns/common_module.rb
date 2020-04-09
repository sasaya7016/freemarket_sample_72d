module Common_Module
  extend ActiveSupport::Concern

  module ClassMethods
    #カラム名のシンボル型を配列で定義
    def column_symbolized_names(reject=[])
      column_names.delete_if{|n| n.in?(reject)}.map(&:to_sym)
    end
  end
end