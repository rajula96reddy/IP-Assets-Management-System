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

ActiveRecord::Schema.define(version: 20161124070916) do

  create_table "contact_us", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "contact_email_id"
    t.string   "Tell_us_more_about_you"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ip_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "Research_group_ID"
    t.string   "Type"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id"
    t.string   "attachment"
    t.decimal  "Total_royalty",                   precision: 10
    t.text     "Title",             limit: 65535
    t.text     "Description",       limit: 65535
    t.boolean  "Is_patented"
    t.boolean  "Is_licensed"
    t.string   "Labs_Associated"
    t.string   "accessibility"
    t.string   "status"
    t.integer  "Original_id"
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ownerships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "content",                 limit: 65535
    t.integer  "user_id"
    t.integer  "ip_asset_id"
    t.decimal  "stakeholding_percentage",               precision: 10
    t.integer  "original_id"
    t.decimal  "individual_royalty",                    precision: 10
    t.index ["id"], name: "id", unique: true, using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                 default: "", null: false
    t.string   "encrypted_password",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.integer  "Research_Groups"
    t.integer  "mobile_number"
    t.boolean  "Is_stakeholder"
    t.decimal  "Individual_royalty",     precision: 10
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
