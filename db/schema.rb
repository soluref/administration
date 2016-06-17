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

ActiveRecord::Schema.define(version: 20160615152659) do

  create_table "acces", force: :cascade do |t|
    t.string "libelle", limit: 80, null: false
    t.string "url",     limit: 80, null: false
  end

  create_table "actualites", force: :cascade do |t|
    t.string  "libelle",      limit: 255, null: false
    t.text    "informations",             null: false
    t.integer "archive",      limit: 1
    t.string  "image",        limit: 80,  null: false
    t.text    "resume",                   null: false
    t.string  "pdf",          limit: 80,  null: false
    t.string  "url",          limit: 255, null: false
  end

  create_table "alertes", force: :cascade do |t|
    t.string  "libelle",     limit: 25, null: false
    t.text    "explication",            null: false
    t.date    "debut",                  null: false
    t.date    "fin",                    null: false
    t.integer "etat",        limit: 1,  null: false
    t.integer "typeAlerte",  limit: 1,  null: false
  end

  add_index "alertes", ["id"], name: "sqlite_autoindex_alertes_1", unique: true

  create_table "articles", force: :cascade do |t|
    t.string   "intitule",   limit: 50, null: false
    t.text     "donnees",               null: false
    t.integer  "archive",    limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "page_id"
  end

  create_table "comptes", primary_key: "user", force: :cascade do |t|
    t.string  "password",   limit: 256, null: false
    t.integer "typeCompte", limit: 10,  null: false
  end

  add_index "comptes", ["user"], name: "sqlite_autoindex_comptes_1", unique: true

  create_table "entites", primary_key: "entite", force: :cascade do |t|
    t.integer "article",  limit: 1,  null: false
    t.string  "intitule", limit: 50, null: false
    t.text    "donnees",             null: false
    t.integer "archive",  limit: 1,  null: false
    t.integer "id"
  end

  add_index "entites", ["entite"], name: "sqlite_autoindex_entites_1", unique: true

  create_table "newsletterinscrits", primary_key: "mail", force: :cascade do |t|
  end

  add_index "newsletterinscrits", ["mail"], name: "sqlite_autoindex_newsletterinscrits_1", unique: true

  create_table "pages", force: :cascade do |t|
    t.string "libelle", limit: 80, null: false
    t.string "url",     limit: 80, null: false
    t.string "couleur", limit: 7,  null: false
  end

  add_index "pages", ["id"], name: "sqlite_autoindex_pages_1", unique: true

  create_table "pdf", id: false, force: :cascade do |t|
    t.integer "article",     limit: 6,   null: false
    t.string  "fichier",     limit: 255, null: false
    t.integer "positionBas", limit: 1,   null: false
  end

  add_index "pdf", ["article", "fichier"], name: "sqlite_autoindex_pdf_1", unique: true

  create_table "produits", force: :cascade do |t|
    t.string   "title"
    t.float    "prix"
    t.integer  "quantite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "services", primary_key: "service", force: :cascade do |t|
    t.integer "article",  limit: 1,  null: false
    t.string  "intitule", limit: 50, null: false
    t.text    "donnees",             null: false
    t.integer "archive",  limit: 1,  null: false
  end

  add_index "services", ["service"], name: "sqlite_autoindex_services_1", unique: true

  create_table "sqlitemanager_temp_table_551100013438", id: false, force: :cascade do |t|
    t.integer  "id",              null: false
    t.string   "nom"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

  add_index "sqlitemanager_temp_table_551100013438", ["id", "nom", "email"], name: "sqlite_autoindex_sqlitemanager_temp_table_551100013438_1", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
