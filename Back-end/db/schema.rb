# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_04_013320) do

  create_table "engine_departments", force: :cascade do |t|
    t.string "department_of_engine_type"
    t.string "name"
  end

  create_table "engines", force: :cascade do |t|
    t.integer "engine_department_id"
    t.string "engine_type"
    t.string "manufactured_engine_id"
    t.string "associated_vehicle_vin"
    t.string "engine_layout"
    t.boolean "camshaft_built"
    t.boolean "piston_built"
    t.boolean "flywheel_built"
    t.boolean "connecting_rod_built"
    t.boolean "crankshaft_built"
    t.boolean "sump_built"
    t.boolean "camshaft_drive_belt_built"
    t.text "remark"
  end

end
