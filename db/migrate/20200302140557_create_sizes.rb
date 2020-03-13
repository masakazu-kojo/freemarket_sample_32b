class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size, index: true
      t.string :ancestry, index: true
    end
  end
end
