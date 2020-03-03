class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :familyname,null: false
      t.string :firstname,null: false
      t.string :familyname_kana,null: false
      t.string :firstname_kana,null: false
      t.date :birthday,null: false
      t.integer :postal_code  #郵便番号
      t.string :prefecture  #都道府県
      t.string :municipality  #市区町村
      t.string :house_number  #番地
      t.string :building_name  #建物名
      t.string :identity_image  #本人確認
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end