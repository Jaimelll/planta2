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

ActiveRecord::Schema.define(version: 2019_04_16_191248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "periodo", default: 1, null: false
    t.integer "categoria", default: 3, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "formulas", force: :cascade do |t|
    t.string "codigo"
    t.bigint "product_id"
    t.float "cantidad"
    t.float "factor"
    t.integer "unidad"
    t.integer "seccion"
    t.string "obs"
    t.float "pedido"
    t.integer "for1"
    t.integer "for2"
    t.float "for3"
    t.float "for4"
    t.string "for5"
    t.string "for6"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_formulas_on_admin_user_id"
    t.index ["product_id"], name: "index_formulas_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "orden"
    t.integer "cantidad"
    t.integer "sele1"
    t.integer "sele2"
    t.integer "sele3"
    t.integer "sele4"
    t.string "str1"
    t.float "num1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin_user_id"
    t.string "codigo"
    t.float "precio"
    t.float "costo"
    t.integer "unidad"
    t.integer "seccion"
    t.float "inventario"
    t.float "pedido"
    t.integer "clase"
    t.integer "familia"
    t.integer "nivel"
    t.date "fecha1"
    t.integer "activo"
    t.index ["admin_user_id"], name: "index_products_on_admin_user_id"
  end

  create_table "situations", force: :cascade do |t|
    t.float "cta"
    t.string "cuenta"
    t.string "detalle"
    t.float "importe"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_situations_on_admin_user_id"
  end

  add_foreign_key "formulas", "admin_users"
  add_foreign_key "formulas", "products"
  add_foreign_key "situations", "admin_users"
end
