crumb :root do
  link "トップページ", root_path
end

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

crumb :list do
  link "出品", category_new_path
end