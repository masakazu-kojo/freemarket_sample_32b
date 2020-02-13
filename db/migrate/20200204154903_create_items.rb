class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name,null: false, index: true          #商品名
      t.text :explanation,null: false    #説明
      t.integer :price,null: false        #価格
      t.string :size                      #サイズ
      t.string :condition,null: false     #状態（選択式）
      t.string :sent_charge,null: false  #配送料の負担
      t.string :shipping_area,null: false  #発送元の地域（選択式）
      t.string :days_to_ship,null: false  #発送までの日数（選択式）
      t.references :user, foreign_key: true #出品者
      t.references :brand, foreign_key: true #ブランド
      t.references :category1, foreign_key: true
      t.references :category2, foreign_key: true
      t.references :category3, foreign_key: true
      t.timestamps
    end
  end
end
