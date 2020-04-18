# トップページ（始まり）
crumb :root do
  link "トップページ", root_path
end

# サインイン
crumb :sign_up do
  link "新規登録",new_user_registration_path
  parent :root
end

crumb :new_address do
  link "住所登録",addresses_path
  parent :sign_up
end

# crumb :subscribed do
#   link "登録完了",categories_path
#   parent :new_address
# end

# ログイン
crumb :login do
  link "ログイン",new_user_session_path
  parent :root
end

# マイページ
crumb :mypage do
  link "マイページ",user_path
  parent :root
end

crumb :nice do
  link "いいね一覧",user_path
  parent :mypage
end

# 商品一覧
crumb :category do
  link "カテゴリー一覧",categories_path
  parent :root
end

crumb :parent do
  @category = Category.find(params[:id])
  if @category.ancestry.nil?
    link "#{@category.name}",category_path(@category.id)
    parent :category
  elsif @category.parent.parent.present?
    link "#{@category.parent.parent.name}", category_path(@category.parent.parent.id)
    link "#{@category.parent.name}", category_path(@category.parent.id)
    link "#{@category.name}",category_path(@category.id)
    parent :category
  else
    link "#{@category.parent.name}", category_path(@category.parent.id)
    link "#{@category.name}",category_path(@category.parent.id)
    parent :category
  end
end

# 出品
crumb :list do
  link "出品", new_item_path
  parent :root
end

# 詳細
# 編集