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

ActiveRecord::Schema.define(version: 2018_08_31_142838) do

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "alumnos", force: :cascade do |t|
    t.integer "matricula"
    t.string "nombre"
    t.string "apellidoP"
    t.string "apellidoM"
    t.integer "semestre_id"
    t.integer "turno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grupo_id"
    t.index ["grupo_id"], name: "index_alumnos_on_grupo_id"
    t.index ["semestre_id"], name: "index_alumnos_on_semestre_id"
    t.index ["turno_id"], name: "index_alumnos_on_turno_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "materia_id"
    t.integer "parcial_id"
    t.integer "turno_id"
    t.integer "semestre_id"
    t.date "fecha"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["materia_id"], name: "index_exams_on_materia_id"
    t.index ["parcial_id"], name: "index_exams_on_parcial_id"
    t.index ["semestre_id"], name: "index_exams_on_semestre_id"
    t.index ["turno_id"], name: "index_exams_on_turno_id"
  end

  create_table "grupos", force: :cascade do |t|
    t.integer "grupo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materia", force: :cascade do |t|
    t.string "materia"
    t.integer "semestre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semestre_id"], name: "index_materia_on_semestre_id"
  end

  create_table "parcials", force: :cascade do |t|
    t.string "noParcial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "examen_id"
    t.text "pregunta"
    t.text "respuestaC"
    t.text "respuesta1"
    t.text "respuesta2"
    t.text "respuesta3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examen_id"], name: "index_questions_on_examen_id"
  end

  create_table "semestres", force: :cascade do |t|
    t.string "nomSemestre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turnos", force: :cascade do |t|
    t.string "nomTurn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
