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

ActiveRecord::Schema.define(version: 20200923021206) do

  create_table "action_mailbox_inbound_emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name", null: false
    t.text "body", limit: 4294967295
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audit_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "action", null: false
    t.integer "user_id"
    t.integer "record_id"
    t.string "record_type"
    t.text "payload"
    t.text "request"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["action"], name: "index_audit_logs_on_action"
    t.index ["record_type", "record_id"], name: "index_audit_logs_on_record_type_and_record_id"
    t.index ["user_id", "action"], name: "index_audit_logs_on_user_id_and_action"
  end

  create_table "emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "subject"
    t.string "content"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_friendly_id_slugs_on_deleted_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: { slug: 20, sluggable_type: 20, scope: 20 }
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 20, sluggable_type: 20 }
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "hospitals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.boolean "sExtremeEmergency", comment: "是否非常非常紧急"
    t.string "name", comment: "医院名称"
    t.string "province", comment: "所在省份"
    t.string "city", comment: "所在城市"
    t.string "suburb", comment: "所在地区"
    t.string "address", comment: "详细地址"
    t.string "contactName", comment: "联系人"
    t.string "contactPhone", comment: "联系电话"
    t.string "official", comment: "是否官方信息（官网/官微）"
    t.string "trueness", comment: "是否核实真实性（电话-微信视频-带相片工作证-医院官方电话核验联系人信息"
    t.string "supplies", comment: "急需物资"
    t.string "drugs", comment: "急需药品"
    t.string "suppliesN95", comment: "N95口罩（个）"
    t.string "suppliesMSM", comment: "医用外科口罩（个）"
    t.string "suppliesA", comment: "一次性医用口罩（个）"
    t.string "suppliesB", comment: "护目镜（个）"
    t.string "suppliesC", comment: "防冲击眼罩（个）"
    t.string "suppliesD", comment: "防水面罩（一次性）（个）"
    t.string "suppliesE", comment: " 防护服（套）"
    t.string "suppliesF", comment: "手术衣（件）"
    t.string "suppliesG", comment: "隔离衣（件）"
    t.string "suppliesH", comment: "医用帽（个）"
    t.string "suppliesI", comment: "防水、防污染鞋（长筒）（套）"
    t.string "suppliesJ", comment: "乳胶手套（双）"
    t.string "suppliesK", comment: "免洗手消毒液"
    t.string "suppliesL", comment: "红外线体温仪"
    t.string "suppliesM", comment: "酒精"
    t.string "suppliesN", comment: "84消毒液"
    t.datetime "suppliesO", comment: "提出日期（到武汉中转站的日期）"
    t.string "suppliesP", comment: "物流编码/线下配送（填线上邮寄编码或写线下配送）"
    t.string "suppliesR", comment: "物流状态（邮寄写到达城市/配送写配送状态：未配送/配送中/已配送）"
    t.string "suppliesS", comment: "送货人"
    t.string "suppliesT", comment: "交付日期（医院收货日期）"
    t.string "suppliesU", comment: "签收人"
    t.string "suppliesV", comment: "备注（不在前面表头的信息，例如病患情况，是否接受社会捐赠）"
    t.string "suppliesW", comment: "备注物资"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hot_hospitals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "province"
    t.string "city"
    t.string "suburb"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.boolean "fever_clinic", default: true
    t.boolean "is_specify", default: false
    t.string "data_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hot_hospitals_copy", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "province"
    t.string "city"
    t.string "suburb"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.boolean "fever_clinic", default: true
    t.boolean "is_specify", default: false
    t.string "data_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "lj_house_0729", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "house_name"
    t.string "school_name"
  end

  create_table "lj_house_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_id"
    t.string "lj_house_url"
    t.string "house_name"
    t.string "build_year"
    t.string "build_type"
    t.string "volume_rate"
    t.string "greening_rate"
    t.string "park_num"
    t.string "park_price"
    t.string "gas_price"
    t.string "water_type"
    t.string "electricity_type"
    t.string "developer"
    t.string "property_company"
    t.string "property_price"
    t.string "building_num"
    t.string "tenement_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lj_house_selleds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_name"
    t.string "property"
    t.string "info_url"
    t.string "desc_name"
    t.date "sell_date"
    t.decimal "total", precision: 12, scale: 2
    t.decimal "average_price", precision: 12, scale: 2
    t.decimal "listing_price", precision: 12, scale: 2
    t.integer "deal_day"
    t.integer "price_diff_time"
    t.integer "daikan"
    t.integer "star"
    t.integer "youlan"
    t.text "images"
    t.string "room_type"
    t.string "floor"
    t.decimal "area", precision: 12, scale: 2
    t.string "room_structure"
    t.decimal "inner_area", precision: 12, scale: 2
    t.string "build_type"
    t.string "look"
    t.integer "build_year"
    t.string "decoration"
    t.string "build_structure"
    t.string "heating"
    t.string "elevator"
    t.string "is_elevator"
    t.string "lj_deal_no"
    t.string "deal_ownership"
    t.date "listing_time"
    t.string "room_age"
    t.string "room_ownership"
    t.text "deal_record"
    t.text "intro"
    t.text "yezhu_intro"
    t.date "snatch_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lj_house_selleds_0729", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_name"
    t.string "info_url"
    t.string "desc_name"
    t.date "sell_date"
    t.decimal "total", precision: 12, scale: 2
    t.decimal "average_price", precision: 12, scale: 2
    t.decimal "listing_price", precision: 12, scale: 2
    t.integer "deal_day"
    t.integer "price_diff_time"
    t.integer "daikan"
    t.integer "star"
    t.integer "youlan"
    t.text "images"
    t.string "room_type"
    t.string "floor"
    t.decimal "area", precision: 12, scale: 2
    t.string "room_structure"
    t.decimal "inner_area", precision: 12, scale: 2
    t.string "build_type"
    t.string "look"
    t.integer "build_year"
    t.string "decoration"
    t.string "build_structure"
    t.string "property"
    t.string "heating"
    t.string "elevator"
    t.string "is_elevator"
    t.string "lj_deal_no"
    t.string "deal_ownership"
    t.date "listing_time"
    t.string "room_age"
    t.string "room_ownership"
    t.text "deal_record"
    t.text "intro"
    t.text "yezhu_intro"
    t.date "snatch_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lj_house_selleds_temp", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "lj_house_id"
    t.string "lj_house_name"
    t.string "lj_house_selled_url"
    t.string "snatch_url"
    t.string "room_desc"
    t.decimal "size", precision: 10
    t.string "look"
    t.string "decoration"
    t.string "floor"
    t.string "tags"
    t.decimal "listing_price", precision: 10
    t.integer "selled_days"
    t.datetime "selled_time"
    t.decimal "selled_price", precision: 10
    t.decimal "price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lj_house_sells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_name"
    t.string "info_url"
    t.string "desc_name"
    t.decimal "listing_price", precision: 12, scale: 2
    t.decimal "square_price", precision: 12, scale: 2
    t.integer "build_year"
    t.string "lj_house_no"
    t.string "room_type"
    t.string "floor"
    t.decimal "area", precision: 12, scale: 2
    t.string "room_structure"
    t.decimal "inner_area", precision: 12, scale: 2
    t.string "build_type"
    t.string "look"
    t.string "build_structure"
    t.string "decoration"
    t.string "elevator"
    t.string "is_elevator"
    t.date "listing_date"
    t.string "deal_ownership"
    t.string "last_deal"
    t.string "property"
    t.string "room_year"
    t.string "room_ownership"
    t.string "mortgage_info"
    t.string "deed_image"
    t.integer "star"
    t.text "intro"
    t.text "images"
    t.integer "senven_daikan"
    t.integer "thirty_daikan"
    t.text "daikan_history"
    t.date "snatch_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lj_house_name"], name: "lj_house_name"
  end

  create_table "lj_house_sells_07", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_name"
    t.string "info_url"
    t.string "desc_name"
    t.decimal "listing_price", precision: 12, scale: 2
    t.decimal "square_price", precision: 12, scale: 2
    t.integer "build_year"
    t.string "lj_house_no"
    t.string "room_type"
    t.string "floor"
    t.decimal "area", precision: 12, scale: 2
    t.string "room_structure"
    t.decimal "inner_area", precision: 12, scale: 2
    t.string "build_type"
    t.string "look"
    t.string "build_structure"
    t.string "decoration"
    t.string "elevator"
    t.string "is_elevator"
    t.date "listing_date"
    t.string "deal_ownership"
    t.string "last_deal"
    t.string "property"
    t.string "room_year"
    t.string "room_ownership"
    t.string "mortgage_info"
    t.string "deed_image"
    t.integer "star"
    t.text "intro"
    t.text "images"
    t.integer "senven_daikan"
    t.integer "thirty_daikan"
    t.text "daikan_history"
    t.date "snatch_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lj_house_name"], name: "lj_house_name"
  end

  create_table "lj_house_sells_temp", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "lj_house_id"
    t.string "lj_house_name"
    t.string "desc_name"
    t.string "lj_house_info_url"
    t.string "snatch_url"
    t.string "room_desc"
    t.decimal "size", precision: 10
    t.string "look"
    t.string "decoration"
    t.string "floor"
    t.decimal "listing_price", precision: 10
    t.decimal "average_price", precision: 10
    t.date "snatch_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lj_houses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_id"
    t.string "zone_url"
    t.string "lj_house_url"
    t.string "lj_house_name"
    t.string "lj_house_chengjiao_url"
    t.integer "lj_house_chengjiao_num"
    t.string "lj_house_zufang_url"
    t.integer "lj_house_zufang_num"
    t.integer "month"
    t.decimal "average_price", precision: 10
    t.string "lj_house_sell_url"
    t.integer "lj_house_sell_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_snatch", default: false
    t.integer "day"
    t.index ["day"], name: "day"
    t.index ["lj_house_name"], name: "lj_house_name"
  end

  create_table "lj_houses_t", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "lj_house_id"
    t.string "zone_url"
    t.string "lj_house_url"
    t.string "lj_house_name"
    t.string "lj_house_chengjiao_url"
    t.integer "lj_house_chengjiao_num"
    t.string "lj_house_zufang_url"
    t.integer "lj_house_zufang_num"
    t.integer "month"
    t.decimal "average_price", precision: 10
    t.string "lj_house_sell_url"
    t.integer "lj_house_sell_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "title"
    t.string "origin_url"
    t.string "resource"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "no"
    t.string "hot"
    t.text "description"
    t.string "image_url"
    t.index ["resource"], name: "index_news_on_resource"
  end

  create_table "pay_totals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "day"
    t.decimal "price", precision: 10
    t.string "where"
    t.boolean "is_company", default: false
    t.string "sex", default: "female"
    t.string "way"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "snatch_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "no"
    t.string "resource"
    t.string "log"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_addresses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "zipcode"
    t.string "phone"
    t.string "state_name"
    t.string "alternative_phone"
    t.string "company"
    t.integer "state_id"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_spree_addresses_on_country_id"
    t.index ["firstname"], name: "index_addresses_on_firstname"
    t.index ["lastname"], name: "index_addresses_on_lastname"
    t.index ["state_id"], name: "index_spree_addresses_on_state_id"
  end

  create_table "spree_adjustments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "source_type"
    t.integer "source_id"
    t.string "adjustable_type"
    t.integer "adjustable_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "label"
    t.boolean "mandatory"
    t.boolean "eligible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.integer "order_id", null: false
    t.boolean "included", default: false
    t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type"
    t.index ["eligible"], name: "index_spree_adjustments_on_eligible"
    t.index ["order_id"], name: "index_spree_adjustments_on_order_id"
    t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type"
  end

  create_table "spree_assets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "viewable_type"
    t.integer "viewable_id"
    t.integer "attachment_width"
    t.integer "attachment_height"
    t.integer "attachment_file_size"
    t.integer "position"
    t.string "attachment_content_type"
    t.string "attachment_file_name"
    t.string "type", limit: 75
    t.datetime "attachment_updated_at"
    t.text "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["position"], name: "index_spree_assets_on_position"
    t.index ["viewable_id"], name: "index_assets_on_viewable_id"
    t.index ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type"
  end

  create_table "spree_calculators", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "type"
    t.string "calculable_type"
    t.integer "calculable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "preferences"
    t.datetime "deleted_at"
    t.index ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type"
    t.index ["deleted_at"], name: "index_spree_calculators_on_deleted_at"
    t.index ["id", "type"], name: "index_spree_calculators_on_id_and_type"
  end

  create_table "spree_countries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "iso_name"
    t.string "iso"
    t.string "iso3"
    t.string "name"
    t.integer "numcode"
    t.boolean "states_required", default: false
    t.datetime "updated_at"
    t.boolean "zipcode_required", default: true
    t.index ["iso_name"], name: "index_spree_countries_on_iso_name", unique: true
    t.index ["name"], name: "index_spree_countries_on_name", unique: true
  end

  create_table "spree_credit_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "month"
    t.string "year"
    t.string "cc_type"
    t.string "last_digits"
    t.integer "address_id"
    t.string "gateway_customer_profile_id"
    t.string "gateway_payment_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "user_id"
    t.integer "payment_method_id"
    t.boolean "default", default: false, null: false
    t.index ["address_id"], name: "index_spree_credit_cards_on_address_id"
    t.index ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id"
    t.index ["user_id"], name: "index_spree_credit_cards_on_user_id"
  end

  create_table "spree_customer_returns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "number"
    t.integer "stock_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_spree_customer_returns_on_number", unique: true
    t.index ["stock_location_id"], name: "index_spree_customer_returns_on_stock_location_id"
  end

  create_table "spree_gateways", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "type"
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.string "environment", default: "development"
    t.string "server", default: "test"
    t.boolean "test_mode", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "preferences"
    t.index ["active"], name: "index_spree_gateways_on_active"
    t.index ["test_mode"], name: "index_spree_gateways_on_test_mode"
  end

  create_table "spree_inventory_units", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "state"
    t.integer "variant_id"
    t.integer "order_id"
    t.integer "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pending", default: true
    t.integer "line_item_id"
    t.integer "quantity", default: 1
    t.integer "original_return_item_id"
    t.index ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id"
    t.index ["order_id"], name: "index_inventory_units_on_order_id"
    t.index ["original_return_item_id"], name: "index_spree_inventory_units_on_original_return_item_id"
    t.index ["shipment_id"], name: "index_inventory_units_on_shipment_id"
    t.index ["variant_id"], name: "index_inventory_units_on_variant_id"
  end

  create_table "spree_line_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "variant_id"
    t.integer "order_id"
    t.integer "quantity", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency"
    t.decimal "cost_price", precision: 10, scale: 2
    t.integer "tax_category_id"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "pre_tax_amount", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "taxable_adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "non_taxable_adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["order_id"], name: "index_spree_line_items_on_order_id"
    t.index ["tax_category_id"], name: "index_spree_line_items_on_tax_category_id"
    t.index ["variant_id"], name: "index_spree_line_items_on_variant_id"
  end

  create_table "spree_log_entries", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "source_type"
    t.integer "source_id"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type"
  end

  create_table "spree_option_type_prototypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
    t.index ["option_type_id"], name: "index_spree_option_type_prototypes_on_option_type_id"
    t.index ["prototype_id", "option_type_id"], name: "spree_option_type_prototypes_prototype_id_option_type_id", unique: true
    t.index ["prototype_id"], name: "index_spree_option_type_prototypes_on_prototype_id"
  end

  create_table "spree_option_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name", limit: 100
    t.string "presentation", limit: 100
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_spree_option_types_on_name"
    t.index ["position"], name: "index_spree_option_types_on_position"
  end

  create_table "spree_option_value_variants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
    t.index ["option_value_id"], name: "index_spree_option_value_variants_on_option_value_id"
    t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", unique: true
    t.index ["variant_id"], name: "index_spree_option_value_variants_on_variant_id"
  end

  create_table "spree_option_values", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "position"
    t.string "name"
    t.string "presentation"
    t.integer "option_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_spree_option_values_on_name"
    t.index ["option_type_id"], name: "index_spree_option_values_on_option_type_id"
    t.index ["position"], name: "index_spree_option_values_on_position"
  end

  create_table "spree_order_promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "order_id"
    t.integer "promotion_id"
    t.index ["order_id"], name: "index_spree_order_promotions_on_order_id"
    t.index ["promotion_id", "order_id"], name: "index_spree_order_promotions_on_promotion_id_and_order_id"
    t.index ["promotion_id"], name: "index_spree_order_promotions_on_promotion_id"
  end

  create_table "spree_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "number", limit: 32
    t.decimal "item_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.string "state"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "user_id"
    t.datetime "completed_at"
    t.integer "bill_address_id"
    t.integer "ship_address_id"
    t.decimal "payment_total", precision: 10, scale: 2, default: "0.0"
    t.string "shipment_state"
    t.string "payment_state"
    t.string "email"
    t.text "special_instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency"
    t.string "last_ip_address"
    t.integer "created_by_id"
    t.decimal "shipment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.string "channel", default: "spree"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "item_count", default: 0
    t.integer "approver_id"
    t.datetime "approved_at"
    t.boolean "confirmation_delivered", default: false
    t.boolean "considered_risky", default: false
    t.string "guest_token"
    t.datetime "canceled_at"
    t.integer "canceler_id"
    t.integer "store_id"
    t.integer "state_lock_version", default: 0, null: false
    t.decimal "taxable_adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "non_taxable_adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["approver_id"], name: "index_spree_orders_on_approver_id"
    t.index ["bill_address_id"], name: "index_spree_orders_on_bill_address_id"
    t.index ["canceler_id"], name: "index_spree_orders_on_canceler_id"
    t.index ["completed_at"], name: "index_spree_orders_on_completed_at"
    t.index ["confirmation_delivered"], name: "index_spree_orders_on_confirmation_delivered"
    t.index ["considered_risky"], name: "index_spree_orders_on_considered_risky"
    t.index ["created_by_id"], name: "index_spree_orders_on_created_by_id"
    t.index ["guest_token"], name: "index_spree_orders_on_guest_token"
    t.index ["number"], name: "index_spree_orders_on_number", unique: true
    t.index ["ship_address_id"], name: "index_spree_orders_on_ship_address_id"
    t.index ["store_id"], name: "index_spree_orders_on_store_id"
    t.index ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id"
  end

  create_table "spree_payment_capture_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id"
  end

  create_table "spree_payment_methods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "type"
    t.string "name"
    t.text "description"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_on", default: "both"
    t.boolean "auto_capture"
    t.text "preferences"
    t.integer "position", default: 0
    t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type"
  end

  create_table "spree_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "order_id"
    t.string "source_type"
    t.integer "source_id"
    t.integer "payment_method_id"
    t.string "state"
    t.string "response_code"
    t.string "avs_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.string "cvv_response_code"
    t.string "cvv_response_message"
    t.index ["number"], name: "index_spree_payments_on_number", unique: true
    t.index ["order_id"], name: "index_spree_payments_on_order_id"
    t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id"
    t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type"
  end

  create_table "spree_preferences", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.text "value"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_spree_preferences_on_key", unique: true
  end

  create_table "spree_prices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "variant_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.string "currency"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_prices_on_deleted_at"
    t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency"
    t.index ["variant_id"], name: "index_spree_prices_on_variant_id"
  end

  create_table "spree_product_option_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "position"
    t.integer "product_id"
    t.integer "option_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id"
    t.index ["position"], name: "index_spree_product_option_types_on_position"
    t.index ["product_id"], name: "index_spree_product_option_types_on_product_id"
  end

  create_table "spree_product_promotion_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id"
    t.index ["promotion_rule_id", "product_id"], name: "index_products_promotion_rules_on_promotion_rule_and_product"
  end

  create_table "spree_product_properties", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "value"
    t.integer "product_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0
    t.index ["position"], name: "index_spree_product_properties_on_position"
    t.index ["product_id"], name: "index_product_properties_on_product_id"
    t.index ["property_id"], name: "index_spree_product_properties_on_property_id"
  end

  create_table "spree_products", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name", default: "", null: false
    t.text "description"
    t.datetime "available_on"
    t.datetime "discontinue_on"
    t.datetime "deleted_at"
    t.string "slug"
    t.text "meta_description"
    t.string "meta_keywords"
    t.integer "tax_category_id"
    t.integer "shipping_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "promotionable", default: true
    t.string "meta_title"
    t.index ["available_on"], name: "index_spree_products_on_available_on"
    t.index ["deleted_at"], name: "index_spree_products_on_deleted_at"
    t.index ["discontinue_on"], name: "index_spree_products_on_discontinue_on"
    t.index ["name"], name: "index_spree_products_on_name"
    t.index ["shipping_category_id"], name: "index_spree_products_on_shipping_category_id"
    t.index ["slug"], name: "index_spree_products_on_slug", unique: true
    t.index ["tax_category_id"], name: "index_spree_products_on_tax_category_id"
  end

  create_table "spree_products_promotion_rules", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id"
    t.index ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id"
  end

  create_table "spree_products_taxons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
    t.index ["position"], name: "index_spree_products_taxons_on_position"
    t.index ["product_id"], name: "index_spree_products_taxons_on_product_id"
    t.index ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id"
  end

  create_table "spree_promotion_action_line_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity", default: 1
  end

  create_table "spree_promotion_actions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "activator_id"
    t.integer "position"
    t.string "type"
  end

  create_table "spree_promotion_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "spree_promotion_rule_taxons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id"
    t.index ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id"
  end

  create_table "spree_promotion_rule_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id"
    t.index ["user_id", "promotion_rule_id"], name: "index_promotion_rules_users_on_user_id_and_promotion_rule_id"
  end

  create_table "spree_promotion_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "activator_id"
    t.integer "user_id"
    t.integer "product_group_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_group_id"], name: "index_promotion_rules_on_product_group_id"
    t.index ["user_id"], name: "index_promotion_rules_on_user_id"
  end

  create_table "spree_promotion_rules_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id"
    t.index ["user_id"], name: "index_promotion_rules_users_on_user_id"
  end

  create_table "spree_promotions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string "name"
    t.string "type"
    t.integer "usage_limit"
    t.string "match_policy", default: "all"
    t.string "code"
    t.boolean "advertise", default: false
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "promotion_category_id"
    t.index ["advertise"], name: "index_spree_promotions_on_advertise"
    t.index ["code"], name: "index_spree_promotions_on_code", unique: true
    t.index ["expires_at"], name: "index_spree_promotions_on_expires_at"
    t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type"
    t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id"
    t.index ["starts_at"], name: "index_spree_promotions_on_starts_at"
  end

  create_table "spree_properties", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "presentation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_spree_properties_on_name"
  end

  create_table "spree_property_prototypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "prototype_id"
    t.integer "property_id"
    t.index ["property_id"], name: "index_spree_property_prototypes_on_property_id"
    t.index ["prototype_id", "property_id"], name: "index_property_prototypes_on_prototype_id_and_property_id", unique: true
    t.index ["prototype_id"], name: "index_spree_property_prototypes_on_prototype_id"
  end

  create_table "spree_prototype_taxons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "taxon_id"
    t.integer "prototype_id"
    t.index ["prototype_id", "taxon_id"], name: "index_spree_prototype_taxons_on_prototype_id_and_taxon_id"
    t.index ["prototype_id"], name: "index_spree_prototype_taxons_on_prototype_id"
    t.index ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id"
  end

  create_table "spree_prototypes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_refund_reasons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "mutable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_spree_refund_reasons_on_name", unique: true
  end

  create_table "spree_refunds", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "payment_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.string "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "refund_reason_id"
    t.integer "reimbursement_id"
    t.index ["payment_id"], name: "index_spree_refunds_on_payment_id"
    t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id"
    t.index ["reimbursement_id"], name: "index_spree_refunds_on_reimbursement_id"
  end

  create_table "spree_reimbursement_credits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "reimbursement_id"
    t.integer "creditable_id"
    t.string "creditable_type"
    t.index ["creditable_id", "creditable_type"], name: "index_reimbursement_credits_on_creditable_id_and_type"
    t.index ["reimbursement_id"], name: "index_spree_reimbursement_credits_on_reimbursement_id"
  end

  create_table "spree_reimbursement_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "mutable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["name"], name: "index_spree_reimbursement_types_on_name", unique: true
    t.index ["type"], name: "index_spree_reimbursement_types_on_type"
  end

  create_table "spree_reimbursements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "number"
    t.string "reimbursement_status"
    t.integer "customer_return_id"
    t.integer "order_id"
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id"
    t.index ["number"], name: "index_spree_reimbursements_on_number", unique: true
    t.index ["order_id"], name: "index_spree_reimbursements_on_order_id"
  end

  create_table "spree_return_authorization_reasons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.boolean "active", default: true
    t.boolean "mutable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_spree_return_authorization_reasons_on_name", unique: true
  end

  create_table "spree_return_authorizations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "number"
    t.string "state"
    t.integer "order_id"
    t.text "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "stock_location_id"
    t.integer "return_authorization_reason_id"
    t.index ["number"], name: "index_spree_return_authorizations_on_number", unique: true
    t.index ["order_id"], name: "index_spree_return_authorizations_on_order_id"
    t.index ["return_authorization_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id"
    t.index ["stock_location_id"], name: "index_spree_return_authorizations_on_stock_location_id"
  end

  create_table "spree_return_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "return_authorization_id"
    t.integer "inventory_unit_id"
    t.integer "exchange_variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "pre_tax_amount", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "included_tax_total", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "additional_tax_total", precision: 12, scale: 4, default: "0.0", null: false
    t.string "reception_status"
    t.string "acceptance_status"
    t.integer "customer_return_id"
    t.integer "reimbursement_id"
    t.text "acceptance_status_errors"
    t.integer "preferred_reimbursement_type_id"
    t.integer "override_reimbursement_type_id"
    t.boolean "resellable", default: true, null: false
    t.index ["customer_return_id"], name: "index_return_items_on_customer_return_id"
    t.index ["exchange_variant_id"], name: "index_spree_return_items_on_exchange_variant_id"
    t.index ["inventory_unit_id"], name: "index_spree_return_items_on_inventory_unit_id"
    t.index ["override_reimbursement_type_id"], name: "index_spree_return_items_on_override_reimbursement_type_id"
    t.index ["preferred_reimbursement_type_id"], name: "index_spree_return_items_on_preferred_reimbursement_type_id"
    t.index ["reimbursement_id"], name: "index_spree_return_items_on_reimbursement_id"
    t.index ["return_authorization_id"], name: "index_spree_return_items_on_return_authorization_id"
  end

  create_table "spree_role_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_spree_role_users_on_role_id"
    t.index ["user_id"], name: "index_spree_role_users_on_user_id"
  end

  create_table "spree_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.index ["name"], name: "index_spree_roles_on_name", unique: true
  end

  create_table "spree_shipments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "tracking"
    t.string "number"
    t.decimal "cost", precision: 10, scale: 2, default: "0.0"
    t.datetime "shipped_at"
    t.integer "order_id"
    t.integer "address_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock_location_id"
    t.decimal "adjustment_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "included_tax_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "pre_tax_amount", precision: 12, scale: 4, default: "0.0", null: false
    t.decimal "taxable_adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "non_taxable_adjustment_total", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["address_id"], name: "index_spree_shipments_on_address_id"
    t.index ["number"], name: "index_spree_shipments_on_number", unique: true
    t.index ["order_id"], name: "index_spree_shipments_on_order_id"
    t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id"
  end

  create_table "spree_shipping_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_spree_shipping_categories_on_name"
  end

  create_table "spree_shipping_method_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "shipping_method_id", null: false
    t.integer "shipping_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true
    t.index ["shipping_category_id"], name: "index_spree_shipping_method_categories_on_shipping_category_id"
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id"
  end

  create_table "spree_shipping_method_zones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_zones_on_shipping_method_id"
    t.index ["zone_id"], name: "index_spree_shipping_method_zones_on_zone_id"
  end

  create_table "spree_shipping_methods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "display_on"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tracking_url"
    t.string "admin_name"
    t.integer "tax_category_id"
    t.string "code"
    t.index ["deleted_at"], name: "index_spree_shipping_methods_on_deleted_at"
    t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id"
  end

  create_table "spree_shipping_rates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "shipment_id"
    t.integer "shipping_method_id"
    t.boolean "selected", default: false
    t.decimal "cost", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tax_rate_id"
    t.index ["selected"], name: "index_spree_shipping_rates_on_selected"
    t.index ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true
    t.index ["shipment_id"], name: "index_spree_shipping_rates_on_shipment_id"
    t.index ["shipping_method_id"], name: "index_spree_shipping_rates_on_shipping_method_id"
    t.index ["tax_rate_id"], name: "index_spree_shipping_rates_on_tax_rate_id"
  end

  create_table "spree_state_changes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "previous_state"
    t.integer "stateful_id"
    t.integer "user_id"
    t.string "stateful_type"
    t.string "next_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type"
  end

  create_table "spree_states", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "abbr"
    t.integer "country_id"
    t.datetime "updated_at"
    t.index ["country_id"], name: "index_spree_states_on_country_id"
  end

  create_table "spree_stock_items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "stock_location_id"
    t.integer "variant_id"
    t.integer "count_on_hand", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "backorderable", default: false
    t.datetime "deleted_at"
    t.index ["backorderable"], name: "index_spree_stock_items_on_backorderable"
    t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at"
    t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id"
    t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id"
    t.index ["variant_id"], name: "index_spree_stock_items_on_variant_id"
  end

  create_table "spree_stock_locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false, null: false
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.integer "state_id"
    t.string "state_name"
    t.integer "country_id"
    t.string "zipcode"
    t.string "phone"
    t.boolean "active", default: true
    t.boolean "backorderable_default", default: false
    t.boolean "propagate_all_variants", default: true
    t.string "admin_name"
    t.index ["active"], name: "index_spree_stock_locations_on_active"
    t.index ["backorderable_default"], name: "index_spree_stock_locations_on_backorderable_default"
    t.index ["country_id"], name: "index_spree_stock_locations_on_country_id"
    t.index ["propagate_all_variants"], name: "index_spree_stock_locations_on_propagate_all_variants"
    t.index ["state_id"], name: "index_spree_stock_locations_on_state_id"
  end

  create_table "spree_stock_movements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "stock_item_id"
    t.integer "quantity", default: 0
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "originator_type"
    t.integer "originator_id"
    t.index ["originator_id", "originator_type"], name: "index_stock_movements_on_originator_id_and_originator_type"
    t.index ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id"
  end

  create_table "spree_stock_transfers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "type"
    t.string "reference"
    t.integer "source_location_id"
    t.integer "destination_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.index ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id"
    t.index ["number"], name: "index_spree_stock_transfers_on_number", unique: true
    t.index ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id"
  end

  create_table "spree_store_credit_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_store_credit_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "store_credit_id", null: false
    t.string "action", null: false
    t.decimal "amount", precision: 8, scale: 2
    t.string "authorization_code", null: false
    t.decimal "user_total_amount", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "originator_id"
    t.string "originator_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["originator_id", "originator_type"], name: "spree_store_credit_events_originator"
    t.index ["store_credit_id"], name: "index_spree_store_credit_events_on_store_credit_id"
  end

  create_table "spree_store_credit_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priority"], name: "index_spree_store_credit_types_on_priority"
  end

  create_table "spree_store_credits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "created_by_id"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.decimal "amount_used", precision: 8, scale: 2, default: "0.0", null: false
    t.text "memo"
    t.datetime "deleted_at"
    t.string "currency"
    t.decimal "amount_authorized", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "originator_id"
    t.string "originator_type"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_spree_store_credits_on_deleted_at"
    t.index ["originator_id", "originator_type"], name: "spree_store_credits_originator"
    t.index ["type_id"], name: "index_spree_store_credits_on_type_id"
    t.index ["user_id"], name: "index_spree_store_credits_on_user_id"
  end

  create_table "spree_stores", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "url"
    t.text "meta_description"
    t.text "meta_keywords"
    t.string "seo_title"
    t.string "mail_from_address"
    t.string "default_currency"
    t.string "code"
    t.boolean "default", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_spree_stores_on_code", unique: true
    t.index ["default"], name: "index_spree_stores_on_default"
    t.index ["url"], name: "index_spree_stores_on_url"
  end

  create_table "spree_taggings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_spree_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "spree_taggings_idx", unique: true
    t.index ["tag_id"], name: "index_spree_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "spree_taggings_idy"
    t.index ["taggable_id"], name: "index_spree_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_spree_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_spree_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_spree_taggings_on_tagger_id"
  end

  create_table "spree_tags", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_spree_tags_on_name", unique: true
  end

  create_table "spree_tax_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_default", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tax_code"
    t.index ["deleted_at"], name: "index_spree_tax_categories_on_deleted_at"
    t.index ["is_default"], name: "index_spree_tax_categories_on_is_default"
  end

  create_table "spree_tax_rates", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.decimal "amount", precision: 8, scale: 5
    t.integer "zone_id"
    t.integer "tax_category_id"
    t.boolean "included_in_price", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "show_rate_in_label", default: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at"
    t.index ["included_in_price"], name: "index_spree_tax_rates_on_included_in_price"
    t.index ["show_rate_in_label"], name: "index_spree_tax_rates_on_show_rate_in_label"
    t.index ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id"
    t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id"
  end

  create_table "spree_taxonomies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0
    t.index ["position"], name: "index_spree_taxonomies_on_position"
  end

  create_table "spree_taxons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer "parent_id"
    t.integer "position", default: 0
    t.string "name", null: false
    t.string "permalink"
    t.integer "taxonomy_id"
    t.integer "lft"
    t.integer "rgt"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "meta_title"
    t.string "meta_description"
    t.string "meta_keywords"
    t.integer "depth"
    t.index ["lft"], name: "index_spree_taxons_on_lft"
    t.index ["name"], name: "index_spree_taxons_on_name"
    t.index ["parent_id"], name: "index_taxons_on_parent_id"
    t.index ["permalink"], name: "index_taxons_on_permalink"
    t.index ["position"], name: "index_spree_taxons_on_position"
    t.index ["rgt"], name: "index_spree_taxons_on_rgt"
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"
  end

  create_table "spree_trackers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "analytics_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "engine", default: 0, null: false
    t.index ["active"], name: "index_spree_trackers_on_active"
  end

  create_table "spree_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "encrypted_password", limit: 128
    t.string "password_salt", limit: 128
    t.string "email"
    t.string "remember_token"
    t.string "persistence_token"
    t.string "reset_password_token"
    t.string "perishable_token"
    t.integer "sign_in_count", default: 0, null: false
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "login"
    t.integer "ship_address_id"
    t.integer "bill_address_id"
    t.string "authentication_token"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spree_api_key", limit: 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["bill_address_id"], name: "index_spree_users_on_bill_address_id"
    t.index ["deleted_at"], name: "index_spree_users_on_deleted_at"
    t.index ["email"], name: "email_idx_unique", unique: true
    t.index ["ship_address_id"], name: "index_spree_users_on_ship_address_id"
    t.index ["spree_api_key"], name: "index_spree_users_on_spree_api_key"
  end

  create_table "spree_variants", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "sku", default: "", null: false
    t.decimal "weight", precision: 8, scale: 2, default: "0.0"
    t.decimal "height", precision: 8, scale: 2
    t.decimal "width", precision: 8, scale: 2
    t.decimal "depth", precision: 8, scale: 2
    t.datetime "deleted_at"
    t.datetime "discontinue_on"
    t.boolean "is_master", default: false
    t.integer "product_id"
    t.decimal "cost_price", precision: 10, scale: 2
    t.string "cost_currency"
    t.integer "position"
    t.boolean "track_inventory", default: true
    t.integer "tax_category_id"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.index ["deleted_at"], name: "index_spree_variants_on_deleted_at"
    t.index ["discontinue_on"], name: "index_spree_variants_on_discontinue_on"
    t.index ["is_master"], name: "index_spree_variants_on_is_master"
    t.index ["position"], name: "index_spree_variants_on_position"
    t.index ["product_id"], name: "index_spree_variants_on_product_id"
    t.index ["sku"], name: "index_spree_variants_on_sku"
    t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id"
    t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory"
  end

  create_table "spree_zone_members", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "zoneable_type"
    t.integer "zoneable_id"
    t.integer "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_spree_zone_members_on_zone_id"
    t.index ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type"
  end

  create_table "spree_zones", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "description"
    t.boolean "default_tax", default: false
    t.integer "zone_members_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.index ["default_tax"], name: "index_spree_zones_on_default_tax"
    t.index ["kind"], name: "index_spree_zones_on_kind"
  end

  create_table "user_keys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
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

  create_table "xi_guas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "name"
    t.string "zhishu"
    t.text "tags"
    t.string "fans"
    t.integer "read"
    t.integer "like"
    t.integer "zaikan"
    t.integer "comments"
    t.integer "articles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zan_huas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "house_name"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 11, scale: 2
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
