class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :send_familyname,null: false
      t.string :send_firstname,null: false
      t.string :send_familyname_kana,null: false
      t.string :send_firstname_kana,null: false
      t.integer :postal_code,null: false  #郵便番号
      t.string :prefecture,null: false  #都道府県
      t.string :municipality,null: false  #市区町村
      t.string :house_number,null: false  #番地
      t.string :building_name      #建物名
      t.integer :phone_number      #電話
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
