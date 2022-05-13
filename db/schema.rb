
ActiveRecord::Schema.define(version: 0) do

 
  create_table "user_role", force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
    t.integer "role_id",       limit: 4, null: false
  end

  add_index "user_role", ["user_id"], name: "user_role_user_id_foreign", using: :btree
  add_index "user_role", ["role_id"], name: "user_role_role_id_foreign", using: :btree

  
  create_table "role", primary_key: "role_id", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.text   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

 
  add_index "role", ["name"], name: "role_name_unique", unique: true, using: :btree

  create_table "user", primary_key: "user_id", force: :cascade do |t|
    t.string   "username",       limit: 50,              null: false
    t.string   "password",       limit: 100,             null: false
    t.string   "email",          limit: 100,             null: false
    t.string   "first_name",                    limit: 255
    t.string   "middle_name",                    limit: 255
    t.string   "last_name",                    limit: 255
    t.integer  "gender",         limit: 1,   default: 0, null: false
    t.string   "designation",    limit: 100
    t.string   "image",          limit: 100
    t.string   "remember_token", limit: 100
    t.datetime "last_password_date"
    t.datetime "deleted_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "user", ["username"], name: "user_username_unique", unique: true, using: :btree

  create_table "task", primary_key: "task_id", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.text   "desc",                     limit: 255
    t.datetime  "due_date"
    t.integer "status_id",                  null: false
    t.integer "assignee_id",                  null: false
    t.datetime "updated_at",                null: false
  end
  
  create_table "notification", primary_key: "notification_id", force: :cascade do |t|
    t.integer   "user_id"
    t.integer   "seen",                      limit: 1, default: 0, null: false                    
    t.datetime  "status_id"
    t.text "notification",                  null: false
    t.timestamp "created_at",                null: false
  end
  
  create_table "comment", primary_key: "comment_id", force: :cascade do |t|
    t.integer   "user_id"
    t.integer   "task_id"                   
    t.text "comment",                  null: false
    t.timestamp "created_at",                null: false
  end
  
  
  create_table "status", primary_key: "status_id", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.text   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end


  add_foreign_key "user_role", "role", primary_key: "role_id", name: "fk_user_role_2"
  add_foreign_key "user_role", "user", primary_key: "user_id", name: "fk_user_role_1"
end
