# トップページ
crumb :root do
  link "トップページ", root_path
end
# カテゴリー
crumb :categories_index do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :categories_show do |category|
  link "#{category.name}", category_path(category)
  parent :categories_index
end

crumb :items_show do |item, category|
  link "#{item.name}", item_path(item)
  parent :categories_show, category
end
# ブランド
crumb :brands_index do
  link "ブランド一覧", brands_path
  parent :root
end

crumb :brands_show do |brand|
  link "#{brand.name}", brand_path(brand)
  parent :root
end

crumb :brand_groups_index do |category|
  link "#{category.name}", brand_brand_groups_path(category)
  parent :brands_index
end

crumb :brand_groups_show do |brand, category|
  link "#{brand.name}", brand_brand_group_path(brand)
  parent :brand_groups_index, category
end

crumb :brand_groups_brand_category do |brand, category|
  link "#{brand.name}/#{category.name}", brand_category_brand_brand_group_path(brand, category)
  parent :brands_index
end
# マイページ
crumb :users_index do
  link "マイページ", users_path
  parent :root
end

crumb :users_like do
  link "いいね！一覧", like_users_path
  parent :users_index
end

crumb :card_new do
  link "クレジットカード新規登録", new_card_path
  parent :users_index
end