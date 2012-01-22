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

ActiveRecord::Schema.define(:version => 20120122033130) do

  create_table "attachments", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.string   "file_uid"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "target_id"
    t.string   "target_type"
  end

  add_index "attachments", ["project_id"], :name => "attachments_project_id_fk"

  create_table "briefs", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "briefs", ["project_id"], :name => "briefs_project_id_fk"

  create_table "budget_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "photo_uid"
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
  end

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forem_forums", :force => true do |t|
    t.string  "title"
    t.text    "description"
    t.integer "category_id"
  end

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",     :default => false, :null => false
    t.boolean  "pinned",     :default => false
    t.boolean  "hidden",     :default => false
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",      :default => 0
  end

  add_index "forem_views", ["topic_id"], :name => "index_forem_views_on_topic_id"
  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"

  create_table "goals_budget_items", :force => true do |t|
    t.integer  "budget_category_id"
    t.integer  "amount_cents"
    t.integer  "timeframe_amount"
    t.string   "timeframe_amount_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brief_id"
  end

  add_index "goals_budget_items", ["brief_id"], :name => "goals_budget_items_brief_id_fk"
  add_index "goals_budget_items", ["budget_category_id"], :name => "goals_budget_items_budget_category_id_fk"

  create_table "goals_features", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brief_id"
    t.integer  "feature_id"
  end

  add_index "goals_features", ["brief_id"], :name => "goals_features_brief_id_fk"
  add_index "goals_features", ["feature_id"], :name => "goals_features_feature_id_fk"

  create_table "goals_labour_inputs", :force => true do |t|
    t.integer  "job_id"
    t.decimal  "implementation_amount",        :precision => 8, :scale => 2
    t.string   "implementation_amount_unit"
    t.string   "implementation_amount_period"
    t.decimal  "maintenance_amount",           :precision => 8, :scale => 2
    t.string   "maintenance_amount_unit"
    t.string   "maintenance_amount_period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brief_id"
  end

  add_index "goals_labour_inputs", ["brief_id"], :name => "goals_labour_inputs_brief_id_fk"
  add_index "goals_labour_inputs", ["job_id"], :name => "goals_labour_inputs_job_id_fk"

  create_table "goals_yields", :force => true do |t|
    t.integer  "use_id"
    t.decimal  "amount",             :precision => 8, :scale => 2
    t.string   "amount_unit"
    t.string   "amount_period"
    t.decimal  "lead_time_in_years", :precision => 8, :scale => 2
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brief_id"
  end

  add_index "goals_yields", ["brief_id"], :name => "goals_yields_brief_id_fk"
  add_index "goals_yields", ["use_id"], :name => "goals_yields_use_id_fk"

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patches", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patches", ["site_id"], :name => "areas_site_id_fk"

  create_table "project_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
  end

  create_table "project_collaborators", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "project_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_collaborators", ["project_id"], :name => "project_collaborators_project_id_fk"
  add_index "project_collaborators", ["user_id"], :name => "project_collaborators_user_id_fk"

  create_table "project_communities", :force => true do |t|
    t.integer  "project_id"
    t.integer  "community_id"
    t.string   "access"
    t.string   "string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_communities", ["community_id"], :name => "project_communities_community_id_fk"
  add_index "project_communities", ["project_id"], :name => "project_communities_project_id_fk"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "climate_zone"
    t.decimal  "site_area",           :precision => 17, :scale => 3
    t.string   "site_area_unit"
    t.string   "photo_uid"
    t.string   "preferred_currency"
    t.string   "preferred_measures"
    t.integer  "project_category_id"
    t.text     "description"
    t.boolean  "is_public",                                          :default => false
  end

  add_index "projects", ["project_category_id"], :name => "projects_project_category_id_fk"

  create_table "sites", :force => true do |t|
    t.integer "project_id"
  end

  add_index "sites", ["project_id"], :name => "sites_project_id_fk"

  create_table "soil_test_result_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
  end

  create_table "soil_test_result_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
  end

  create_table "soil_test_results", :force => true do |t|
    t.integer  "soil_test_id"
    t.decimal  "amount",                   :precision => 15, :scale => 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "soil_test_result_type_id"
    t.integer  "soil_test_result_unit_id"
  end

  add_index "soil_test_results", ["soil_test_id"], :name => "soil_test_results_soil_test_id_fk"
  add_index "soil_test_results", ["soil_test_result_type_id"], :name => "soil_test_results_soil_test_result_type_id_fk"
  add_index "soil_test_results", ["soil_test_result_unit_id"], :name => "soil_test_results_soil_test_result_unit_id_fk"

  create_table "soil_tests", :force => true do |t|
    t.integer  "site_id"
    t.integer  "patch_id"
    t.date     "tested_on"
    t.string   "reference"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "depth",             :precision => 8, :scale => 2
    t.string   "depth_unit"
    t.integer  "number_of_samples"
    t.text     "notes"
    t.string   "file_uid"
    t.string   "file_name"
  end

  add_index "soil_tests", ["patch_id"], :name => "soil_tests_area_id_fk"
  add_index "soil_tests", ["site_id"], :name => "soil_tests_site_id_fk"

  create_table "soils", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "wrb98_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "soils", ["site_id"], :name => "soils_site_id_fk"

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
    t.boolean  "forem_admin",            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "uses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "attachments", "projects", :name => "attachments_project_id_fk"

  add_foreign_key "briefs", "projects", :name => "briefs_project_id_fk"

  add_foreign_key "goals_budget_items", "briefs", :name => "goals_budget_items_brief_id_fk"
  add_foreign_key "goals_budget_items", "budget_categories", :name => "goals_budget_items_budget_category_id_fk"

  add_foreign_key "goals_features", "briefs", :name => "goals_features_brief_id_fk"
  add_foreign_key "goals_features", "features", :name => "goals_features_feature_id_fk"

  add_foreign_key "goals_labour_inputs", "briefs", :name => "goals_labour_inputs_brief_id_fk"
  add_foreign_key "goals_labour_inputs", "jobs", :name => "goals_labour_inputs_job_id_fk"

  add_foreign_key "goals_yields", "briefs", :name => "goals_yields_brief_id_fk"
  add_foreign_key "goals_yields", "uses", :name => "goals_yields_use_id_fk"

  add_foreign_key "patches", "sites", :name => "areas_site_id_fk"

  add_foreign_key "project_collaborators", "projects", :name => "project_collaborators_project_id_fk"
  add_foreign_key "project_collaborators", "users", :name => "project_collaborators_user_id_fk"

  add_foreign_key "project_communities", "communities", :name => "project_communities_community_id_fk"
  add_foreign_key "project_communities", "projects", :name => "project_communities_project_id_fk"

  add_foreign_key "projects", "project_categories", :name => "projects_project_category_id_fk"

  add_foreign_key "sites", "projects", :name => "sites_project_id_fk"

  add_foreign_key "soil_test_results", "soil_test_result_types", :name => "soil_test_results_soil_test_result_type_id_fk"
  add_foreign_key "soil_test_results", "soil_test_result_units", :name => "soil_test_results_soil_test_result_unit_id_fk"
  add_foreign_key "soil_test_results", "soil_tests", :name => "soil_test_results_soil_test_id_fk"

  add_foreign_key "soil_tests", "patches", :name => "soil_tests_patch_id_fk"
  add_foreign_key "soil_tests", "sites", :name => "soil_tests_site_id_fk"

  add_foreign_key "soils", "sites", :name => "soils_site_id_fk"

end
