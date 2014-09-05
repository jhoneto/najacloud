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

ActiveRecord::Schema.define(version: 20140903172105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "direitos", force: true do |t|
    t.string   "classe",     null: false
    t.string   "funcao",     null: false
    t.string   "descricao",  null: false
    t.string   "chave"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pacientes", force: true do |t|
    t.string   "codigo"
    t.string   "nome"
    t.boolean  "ativo"
    t.string   "sexo",            limit: 1
    t.date     "data_nascimento"
    t.integer  "organizacao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfil_direitos", force: true do |t|
    t.integer  "organizacao_id", null: false
    t.integer  "perfil_id",      null: false
    t.integer  "direito_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfis", force: true do |t|
    t.integer  "organizacao_id", null: false
    t.string   "nome",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", force: true do |t|
    t.integer  "organizacao_id", null: false
    t.string   "nome",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_perfis", force: true do |t|
    t.integer  "organizacao_id", null: false
    t.integer  "usuario_id",     null: false
    t.integer  "perfil_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_unidades", force: true do |t|
    t.integer  "organizacao_id", null: false
    t.integer  "usuario_id",     null: false
    t.integer  "unidade_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nome",                   default: "", null: false
    t.string   "username",                            null: false
    t.integer  "organizacao_id",                      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unidade_id"
  end

  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  add_index "usuarios", ["username"], name: "index_usuarios_on_username", unique: true, using: :btree

end
