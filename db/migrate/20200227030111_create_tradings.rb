class CreateTradings < ActiveRecord::Migration[5.2]
  def change
    create_table :tradings do |t|
      t.boolean    :status, default: true, null: false
      t.references :item, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
