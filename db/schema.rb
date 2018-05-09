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

ActiveRecord::Schema.define(version: 20180430041528) do

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "company_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "all_employee_number"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["company_email"], name: "index_companies_on_company_email", unique: true
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.integer "employee_number"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "age"
    t.integer "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_employees_on_email", unique: true
  end

  create_table "project_values", force: :cascade do |t|
    t.integer "project_id"
    t.integer "value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "value_id"], name: "index_project_values_on_project_id_and_value_id", unique: true
    t.index ["project_id"], name: "index_project_values_on_project_id"
    t.index ["value_id"], name: "index_project_values_on_value_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.integer "company_id"
    t.integer "employee_number"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "created_at"], name: "index_projects_on_company_id_and_created_at"
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "department_id"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id", "employee_id"], name: "index_relationships_on_department_id_and_employee_id", unique: true
    t.index ["department_id"], name: "index_relationships_on_department_id"
    t.index ["employee_id"], name: "index_relationships_on_employee_id"
  end

  create_table "values", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "a1"
    t.integer "a2"
    t.integer "a3"
    t.integer "a4"
    t.integer "a5"
    t.integer "a6"
    t.integer "a7"
    t.integer "a8"
    t.integer "a9"
    t.integer "a10"
    t.integer "a11"
    t.integer "a12"
    t.integer "a13"
    t.integer "a14"
    t.integer "a15"
    t.integer "a16"
    t.integer "a17"
    t.integer "b1"
    t.integer "b2"
    t.integer "b3"
    t.integer "b4"
    t.integer "b5"
    t.integer "b6"
    t.integer "b7"
    t.integer "b8"
    t.integer "b9"
    t.integer "b10"
    t.integer "b11"
    t.integer "b12"
    t.integer "b13"
    t.integer "b14"
    t.integer "b15"
    t.integer "b16"
    t.integer "b17"
    t.integer "b18"
    t.integer "b19"
    t.integer "b20"
    t.integer "b21"
    t.integer "b22"
    t.integer "b23"
    t.integer "b24"
    t.integer "b25"
    t.integer "b26"
    t.integer "b27"
    t.integer "b28"
    t.integer "b29"
    t.integer "c1"
    t.integer "c2"
    t.integer "c3"
    t.integer "c4"
    t.integer "c5"
    t.integer "c6"
    t.integer "c7"
    t.integer "c8"
    t.integer "c9"
    t.integer "d1"
    t.integer "d2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "interview", default: false
    t.index ["employee_id", "created_at"], name: "index_values_on_employee_id_and_created_at"
    t.index ["employee_id"], name: "index_values_on_employee_id"
  end

end
