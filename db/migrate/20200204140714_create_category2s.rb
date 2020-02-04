class CreateCategory2s < ActiveRecord::Migration[5.2]
  def change
    create_table :category2s do |t|
      t.string :category2_name,null: false, index: true      #カテゴリー2の名称
      t.references :category1, foreign_key: true
    end
  end
end
