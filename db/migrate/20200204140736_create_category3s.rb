class CreateCategory3s < ActiveRecord::Migration[5.2]
  def change
    create_table :category3s do |t|
      t.string :category3_name,null: false, index: true       #カテゴリー3の名称
      t.references :category2, foreign_key: true
    end
  end
end
