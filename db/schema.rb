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

ActiveRecord::Schema.define(version: 20150523174532) do

  create_table "cpus", force: true do |t|
    t.string   "brand"
    t.string   "processor_number"
    t.string   "instruction_set"
    t.integer  "cores"
    t.integer  "threads"
    t.float    "frequency",        limit: 24
    t.string   "socket_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "purchased_at"
    t.string   "serialnumber"
    t.string   "servicetag"
    t.integer  "user_id"
    t.string   "color"
    t.integer  "number_of_cpu"
    t.integer  "number_of_mem"
    t.text     "features"
    t.text     "information"
    t.integer  "cpu_id"
    t.integer  "memory_module_id"
    t.string   "model_name"
    t.integer  "manufacturer_id"
    t.integer  "device_type_id"
  end

  add_index "devices", ["name"], name: "index_devices_on_name", unique: true, using: :btree

  create_table "devices_programs", id: false, force: true do |t|
    t.integer "device_id",  null: false
    t.integer "program_id", null: false
  end

  add_index "devices_programs", ["device_id"], name: "index_devices_programs_on_device_id", using: :btree
  add_index "devices_programs", ["program_id"], name: "index_devices_programs_on_program_id", using: :btree

  create_table "documents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "device_id"
    t.string   "name"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memory_modules", force: true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "modeltype"
    t.integer  "capacity"
    t.integer  "modules"
    t.string   "buildform"
    t.string   "speed"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_interface_cards", force: true do |t|
    t.string   "brand"
    t.string   "device_type"
    t.string   "chipset"
    t.string   "transfer_rate"
    t.string   "interface"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_id"
  end

  create_table "network_interfaces", force: true do |t|
    t.string   "roomnumber"
    t.string   "interface"
    t.string   "ip"
    t.string   "subnet"
    t.string   "router"
    t.string   "dns"
    t.string   "ip6"
    t.string   "router6"
    t.string   "prefix"
    t.string   "domains"
    t.string   "mac"
    t.string   "speed"
    t.string   "duplex"
    t.boolean  "dhcp"
    t.integer  "vlan"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_interface_card_id"
  end

  create_table "programs", force: true do |t|
    t.string   "title"
    t.string   "version"
    t.date     "purchased_at"
    t.string   "license"
    t.text     "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "os"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
