class RenameBrandNameColumnToBrands < ActiveRecord::Migration[5.2]
  def change
    rename_column :brands, :brand_name, :name
    rename_column :categories, :category_name, :name
    rename_column :items, :item_name, :name
  end
end
