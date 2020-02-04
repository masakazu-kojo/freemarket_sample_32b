class CreateCategory1s < ActiveRecord::Migration[5.2]
  def change
    create_table :category1s do |t|
      t.string :category1_name,null: false, index: true      #カテゴリー1の名称
      
    end
  end
end
