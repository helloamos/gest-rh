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

ActiveRecord::Schema.define(version: 20181122185236) do

  create_table "avancements", force: :cascade do |t|
    t.string "matricule_employe"
    t.date "date_avancement"
    t.string "etat"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_avancements_on_user_id"
  end

  create_table "conges", force: :cascade do |t|
    t.string "matricule_employe"
    t.date "date_debut"
    t.date "date_fin"
    t.string "motif"
    t.string "etat"
    t.integer "type_conge_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_conge_id"], name: "index_conges_on_type_conge_id"
    t.index ["user_id"], name: "index_conges_on_user_id"
  end

  create_table "demissions", force: :cascade do |t|
    t.date "date_demission"
    t.string "matricule_employe"
    t.string "etat"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_demissions_on_user_id"
  end

  create_table "employes", force: :cascade do |t|
    t.string "matricule"
    t.string "nom"
    t.string "prenom"
    t.string "sexe"
    t.date "date_naissance"
    t.string "lieu_naissance"
    t.string "adresse"
    t.string "telephone"
    t.string "email"
    t.string "situation"
    t.integer "nombre_enfant"
    t.string "groupage"
    t.string "numero_cin"
    t.string "nom_diplome"
    t.date "date_obt_diplome"
    t.string "reliquat"
    t.date "date_entree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fonctions", force: :cascade do |t|
    t.string "nom"
    t.string "etat"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fonctions_on_user_id"
  end

  create_table "mutations", force: :cascade do |t|
    t.string "matricule_employe"
    t.string "etablissement_origine"
    t.string "etablissement_destination"
    t.text "motif"
    t.date "date_mutation"
    t.string "etat"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mutations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sanctions", force: :cascade do |t|
    t.string "matricule_employe"
    t.date "date_debut"
    t.date "date_fin"
    t.text "motif"
    t.string "etat"
    t.integer "type_sanction_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_sanction_id"], name: "index_sanctions_on_type_sanction_id"
    t.index ["user_id"], name: "index_sanctions_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "nom"
    t.string "telephone"
    t.string "etat"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "super_admins", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_conges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_sanctions", force: :cascade do |t|
    t.string "nom"
    t.text "description"
    t.string "etat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "role", null: false
    t.string "status", default: "enable", null: false
    t.boolean "receives_notifications", default: false
    t.bigint "created_by"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
