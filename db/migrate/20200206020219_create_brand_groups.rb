class CreateBrandGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_groups do |t|
      t.references :category1, foreign_key: true
      t.references :brand, foreign_key: true
    end
  end
end
