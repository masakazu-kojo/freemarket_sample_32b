class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name,null: false, index: true      #カテゴリー1の名称
      t.string :ancestry, index: true
    end
  end
end
