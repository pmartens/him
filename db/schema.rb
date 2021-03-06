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

ActiveRecord::Schema.define(version: 20151020211848) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "document_id",         limit: 4
    t.integer  "attachmentable_id",   limit: 4
    t.string   "attachmentable_type", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "attachments", ["attachmentable_type", "attachmentable_id"], name: "index_documents_on_attachmentable_type_and_attachmentable_id", using: :btree
  add_index "attachments", ["document_id"], name: "index_documents_on_document_files_id", using: :btree

  create_table "contacts_addresses", force: :cascade do |t|
    t.string   "addresstype", limit: 255
    t.string   "street",      limit: 255
    t.string   "housenumber", limit: 255
    t.string   "postalcode",  limit: 255
    t.string   "city",        limit: 255
    t.string   "country",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "contact_id",  limit: 4
  end

  create_table "contacts_companies", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "main_contact_id", limit: 4
  end

  create_table "contacts_contacts", force: :cascade do |t|
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.date     "birthdate"
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "company_id", limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "contacts_emails", force: :cascade do |t|
    t.string   "emailtype",  limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "contact_id", limit: 4
  end

  create_table "contacts_homepages", force: :cascade do |t|
    t.string   "homepagetype", limit: 255
    t.string   "url",          limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "contact_id",   limit: 4
  end

  create_table "contacts_phones", force: :cascade do |t|
    t.string   "phonetype",   limit: 255
    t.string   "phonenumber", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "contact_id",  limit: 4
  end

  create_table "cpus", force: :cascade do |t|
    t.string   "brand",            limit: 255
    t.string   "processor_number", limit: 255
    t.string   "instruction_set",  limit: 255
    t.integer  "cores",            limit: 4
    t.integer  "threads",          limit: 4
    t.float    "frequency",        limit: 24
    t.string   "socket_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "purchased_at"
    t.string   "serialnumber",     limit: 255
    t.string   "servicetag",       limit: 255
    t.integer  "user_id",          limit: 4
    t.string   "color",            limit: 255
    t.integer  "number_of_cpu",    limit: 4
    t.integer  "number_of_mem",    limit: 4
    t.text     "features",         limit: 65535
    t.text     "information",      limit: 65535
    t.integer  "cpu_id",           limit: 4
    t.integer  "memory_module_id", limit: 4
    t.string   "device_model",     limit: 255
    t.integer  "manufacturer_id",  limit: 4
    t.integer  "device_type_id",   limit: 4
  end

  add_index "devices", ["name"], name: "index_devices_on_name", unique: true, using: :btree

  create_table "devices_programs", id: false, force: :cascade do |t|
    t.integer "device_id",  limit: 4, null: false
    t.integer "program_id", limit: 4, null: false
  end

  add_index "devices_programs", ["device_id"], name: "index_devices_programs_on_device_id", using: :btree
  add_index "devices_programs", ["program_id"], name: "index_devices_programs_on_program_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.string   "name",                  limit: 255
  end

  create_table "invoice_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "invoicenumber",   limit: 255
    t.datetime "invoicedate"
    t.string   "state",           limit: 255, default: ""
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id",         limit: 4
    t.integer  "invoice_type_id", limit: 4
    t.integer  "supplier_id",     limit: 4
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memory_modules", force: :cascade do |t|
    t.string   "brand",       limit: 255
    t.string   "model",       limit: 255
    t.string   "modeltype",   limit: 255
    t.integer  "capacity",    limit: 4
    t.integer  "modules",     limit: 4
    t.string   "buildform",   limit: 255
    t.string   "speed",       limit: 255
    t.text     "information", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_interface_cards", force: :cascade do |t|
    t.string   "brand",         limit: 255
    t.string   "device_type",   limit: 255
    t.string   "chipset",       limit: 255
    t.string   "transfer_rate", limit: 255
    t.string   "interface",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_id",     limit: 4
  end

  create_table "network_interfaces", force: :cascade do |t|
    t.string   "roomnumber",                limit: 255
    t.string   "interface",                 limit: 255
    t.string   "ip",                        limit: 255
    t.string   "subnet",                    limit: 255
    t.string   "router",                    limit: 255
    t.string   "dns",                       limit: 255
    t.string   "ip6",                       limit: 255
    t.string   "router6",                   limit: 255
    t.string   "prefix",                    limit: 255
    t.string   "domains",                   limit: 255
    t.string   "mac",                       limit: 255
    t.string   "speed",                     limit: 255
    t.string   "duplex",                    limit: 255
    t.boolean  "dhcp"
    t.integer  "vlan",                      limit: 4
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_interface_card_id", limit: 4
  end

  create_table "news_posts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "version",      limit: 255
    t.date     "purchased_at"
    t.string   "license",      limit: 255
    t.text     "properties",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "os"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
