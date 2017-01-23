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

ActiveRecord::Schema.define(version: 20170113134100) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "action"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "person_target_id"
    t.string   "person_target_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "full_name"
    t.string   "avatar"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_albums_on_club_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "club_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description",     limit: 65535
    t.string   "action"
    t.string   "logo"
    t.integer  "status_id",                     default: 1
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["organization_id"], name: "index_club_requests_on_organization_id", using: :btree
    t.index ["status_id"], name: "index_club_requests_on_status_id", using: :btree
    t.index ["user_id"], name: "index_club_requests_on_user_id", using: :btree
  end

  create_table "clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.text     "notification",    limit: 65535
    t.text     "description",     limit: 65535
    t.integer  "money",                         default: 0
    t.float    "rating",          limit: 24,    default: 0.0
    t.boolean  "is_active",                     default: true
    t.string   "logo"
    t.string   "image"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["organization_id"], name: "index_clubs_on_organization_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",     limit: 65535
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "event_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",       limit: 65535
    t.integer  "expense",                         default: 0
    t.integer  "club_id"
    t.integer  "event_category_id"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "location",          limit: 65535
    t.integer  "num_like",                        default: 0
    t.string   "image"
    t.boolean  "is_finish",                       default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["club_id"], name: "index_events_on_club_id", using: :btree
    t.index ["event_category_id"], name: "index_events_on_event_category_id", using: :btree
  end

  create_table "hobbies_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "album_id"
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_images_on_album_id", using: :btree
    t.index ["user_id"], name: "index_images_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["club_id"], name: "index_messages_on_club_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.string   "image"
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "approve",                  default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["event_id"], name: "index_news_on_event_id", using: :btree
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.text     "content",     limit: 65535
    t.string   "url"
    t.boolean  "read",                      default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "organization_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "phone"
    t.string   "email"
    t.text     "location",    limit: 65535
    t.string   "logo"
    t.integer  "status_id",                 default: 1
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["status_id"], name: "index_organization_requests_on_status_id", using: :btree
    t.index ["user_id"], name: "index_organization_requests_on_user_id", using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "phone"
    t.string   "email"
    t.text     "location",    limit: 65535
    t.string   "logo"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "star"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "target_hobbies_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "hobbies_tag_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hobbies_tag_id"], name: "index_target_hobbies_tags_on_hobbies_tag_id", using: :btree
  end

  create_table "user_clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.boolean  "is_manager", default: false
    t.integer  "status_id",  default: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["club_id"], name: "index_user_clubs_on_club_id", using: :btree
    t.index ["status_id"], name: "index_user_clubs_on_status_id", using: :btree
    t.index ["user_id", "club_id"], name: "index_user_clubs_on_user_id_and_club_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_clubs_on_user_id", using: :btree
  end

  create_table "user_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_user_events_on_user_id_and_event_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_events_on_user_id", using: :btree
  end

  create_table "user_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.integer  "status_id",       default: 1
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
    t.index ["status_id"], name: "index_user_organizations_on_status_id", using: :btree
    t.index ["user_id", "organization_id"], name: "index_user_organizations_on_user_id_and_organization_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_organizations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "full_name"
    t.string   "avatar"
    t.string   "phone"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "albums", "clubs"
  add_foreign_key "club_requests", "organizations"
  add_foreign_key "club_requests", "statuses"
  add_foreign_key "club_requests", "users"
  add_foreign_key "clubs", "organizations"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "clubs"
  add_foreign_key "events", "event_categories"
  add_foreign_key "images", "albums"
  add_foreign_key "images", "users"
  add_foreign_key "messages", "clubs"
  add_foreign_key "messages", "users"
  add_foreign_key "news", "events"
  add_foreign_key "news", "users"
  add_foreign_key "organization_requests", "statuses"
  add_foreign_key "organization_requests", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "target_hobbies_tags", "hobbies_tags"
  add_foreign_key "user_clubs", "clubs"
  add_foreign_key "user_clubs", "statuses"
  add_foreign_key "user_clubs", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "user_organizations", "organizations"
  add_foreign_key "user_organizations", "statuses"
  add_foreign_key "user_organizations", "users"
end
