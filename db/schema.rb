# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111231024910) do

  create_table "budget_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
  end

  create_table "budget_goals", :force => true do |t|
    t.integer  "project_id"
    t.integer  "budget_category_id"
    t.integer  "amount_cents"
    t.integer  "timeframe_amount"
    t.string   "timeframe_amount_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labour_input_goals", :force => true do |t|
    t.integer  "job_id"
    t.integer  "project_id"
    t.float    "implementation_amount"
    t.string   "implementation_amount_unit"
    t.string   "implementation_amount_period"
    t.float    "maintenance_amount"
    t.string   "maintenance_amount_unit"
    t.string   "maintenance_amount_period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "gmaps"
    t.string   "climate_zone"
    t.float    "size"
    t.string   "size_units"
    t.string   "photo_uid"
    t.integer  "user_id"
    t.string   "preferred_currency"
    t.string   "preferred_measures"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   :default => "user"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "uses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yield_goals", :force => true do |t|
    t.integer  "use_id"
    t.integer  "project_id"
    t.float    "amount"
    t.string   "amount_unit"
    t.string   "amount_period"
    t.float    "lead_time_in_years"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
