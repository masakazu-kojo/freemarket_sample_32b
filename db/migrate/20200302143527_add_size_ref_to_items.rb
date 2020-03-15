class AddSizeRefToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :size
    add_reference :items, :size, foreign_key: true
  end
end
