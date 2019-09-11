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

ActiveRecord::Schema.define(version: 20190911093221) do

  create_table "houses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "楼盘名称"
    t.string "area_name"
    t.integer "area_id"
    t.string "sale_number", comment: "预售证号"
    t.string "range", comment: "在售范围"
    t.integer "num", comment: "在售套数"
    t.string "phone", comment: "开发商联系方式"
    t.datetime "start_time", comment: "登记开始时间"
    t.datetime "end_time", comment: "登记结束时间"
    t.datetime "select_time", comment: "选房结束时间"
    t.string "status", comment: "项目报名状态"
    t.text "detail", comment: "登记规则"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_houses_on_area_id"
    t.index ["name"], name: "index_houses_on_name"
    t.index ["sale_number"], name: "index_houses_on_sale_number"
    t.index ["status"], name: "index_houses_on_status"
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "origin_url"
    t.string "resource"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "no"
    t.string "hot"
    t.text "description"
    t.string "image_url"
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "user_keys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "access_token"
    t.datetime "expires_at"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false, comment: "是否激活"
    t.datetime "activated_at"
    t.boolean "admin", default: false, comment: "是否是管理员"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
