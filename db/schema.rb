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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140506064408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assigned_roles", force: true do |t|
    t.integer  "volunteer_role_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigned_roles", ["person_id"], name: "index_assigned_roles_on_person_id", using: :btree
  add_index "assigned_roles", ["volunteer_role_id"], name: "index_assigned_roles_on_volunteer_role_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.string   "description"
    t.text     "bio"
    t.string   "twitter"
    t.string   "github"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["person_id"], name: "index_profiles_on_person_id", using: :btree

  create_table "programs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_roles", force: true do |t|
    t.integer  "project_team_id"
    t.string   "title"
    t.string   "overview"
    t.text     "description"
    t.integer  "previous_person_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_roles", ["person_id"], name: "index_project_roles_on_person_id", using: :btree
  add_index "project_roles", ["previous_person_id"], name: "index_project_roles_on_previous_person_id", using: :btree
  add_index "project_roles", ["project_team_id"], name: "index_project_roles_on_project_team_id", using: :btree

  create_table "project_teams", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_teams", ["project_id"], name: "index_project_teams_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "overview"
    t.string   "live_url"
    t.string   "codebase"
    t.string   "environment"
    t.text     "description"
    t.string   "based_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteer_roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
