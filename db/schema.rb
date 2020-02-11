# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_04_154905) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand_name", null: false
    t.index ["brand_name"], name: "index_brands_on_brand_name"
  end

  create_table "category1s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category1_name", null: false
    t.index ["category1_name"], name: "index_category1s_on_category1_name"
  end

  create_table "category2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category2_name", null: false
    t.bigint "category1_id"
    t.index ["category1_id"], name: "index_category2s_on_category1_id"
    t.index ["category2_name"], name: "index_category2s_on_category2_name"
  end

  create_table "category3s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category3_name", null: false
    t.bigint "category2_id"
    t.index ["category2_id"], name: "index_category3s_on_category2_id"
    t.index ["category3_name"], name: "index_category3s_on_category3_name"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image"], name: "index_images_on_image"
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.text "explanation", null: false
    t.integer "price", null: false
    t.string "condition", null: false
    t.boolean "sent_charge", null: false
    t.string "shipping_area", null: false
    t.string "days_to_ship", null: false
    t.bigint "user_id"
    t.bigint "brand_id"
    t.bigint "category1_id"
    t.bigint "category2_id"
    t.bigint "category3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category1_id"], name: "index_items_on_category1_id"
    t.index ["category2_id"], name: "index_items_on_category2_id"
    t.index ["category3_id"], name: "index_items_on_category3_id"
    t.index ["item_name"], name: "index_items_on_item_name"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sales"
    t.integer "points"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "category2s", "category1s"
  add_foreign_key "category3s", "category2s"
  add_foreign_key "comments", "items"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "category1s"
  add_foreign_key "items", "category2s"
  add_foreign_key "items", "category3s"
  add_foreign_key "items", "users"
end
