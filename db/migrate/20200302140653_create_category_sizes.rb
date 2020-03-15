class CreateCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_sizes do |t|
      t.references :size, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
