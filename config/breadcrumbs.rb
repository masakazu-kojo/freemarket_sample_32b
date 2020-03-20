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

crumb :brand_groups_index do |category|
  link "#{category.name}", brand_brand_groups_path(category)
  parent :brands_index
end

crumb :brand_groups_show do |brand|
  link "#{brand.name}", brand_brand_group_path(brand)
  parent :brands_index
end

crumb :brand_groups_brand_category do |brand, category|
  link "#{brand.name}/#{category.name}", brand_category_brand_brand_group_path(brand, category)
  parent :brands_index
end


# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).