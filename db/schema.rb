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

ActiveRecord::Schema.define(version: 20140217211538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "equipos", force: true do |t|
    t.string   "equipo"
    t.string   "marca"
    t.string   "modelo"
    t.string   "serie"
    t.string   "inventario"
    t.integer  "tipo"
    t.integer  "clasificacion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "equipos", ["user_id"], name: "index_equipos_on_user_id", using: :btree

  create_table "mantenimiento_preventivos", force: true do |t|
    t.date     "fecha"
    t.text     "reporte"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equipo_id"
  end

  add_index "mantenimiento_preventivos", ["equipo_id"], name: "index_mantenimiento_preventivos_on_equipo_id", using: :btree

  create_table "metrologias", force: true do |t|
    t.date     "fecha"
    t.text     "reporte"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equipo_id"
  end

  add_index "metrologias", ["equipo_id"], name: "index_metrologias_on_equipo_id", using: :btree

  create_table "ordenes", force: true do |t|
    t.string   "solicitante"
    t.integer  "tipoOrden"
    t.string   "actividadRealizada"
    t.string   "personaRecibe"
    t.decimal  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "falla"
    t.date     "fecha_programada"
    t.integer  "equipo_id"
  end

  add_index "ordenes", ["equipo_id"], name: "index_ordenes_on_equipo_id", using: :btree

  create_table "proveedors", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repuestos", force: true do |t|
    t.string   "descripcion"
    t.decimal  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tecnicos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
