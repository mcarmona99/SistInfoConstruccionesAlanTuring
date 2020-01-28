# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_10_161116) do

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "NIF_C", null: false
    t.string "razon_social"
    t.string "direccion"
    t.string "tlf"
    t.string "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["NIF_C"], name: "NIF_C_UNIQUE", unique: true
  end

  create_table "constructions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "cod_obra", null: false
    t.string "direccion"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_constructions_on_client_id"
    t.index ["cod_obra"], name: "cod_obra_UNIQUE", unique: true
  end

  create_table "providers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "NIF_P", null: false
    t.string "razon_social"
    t.string "direccion"
    t.string "tlf"
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["NIF_P"], name: "NIF_P_UNIQUE", unique: true
  end

  create_table "purchase_invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "n_factura", null: false
    t.bigint "provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["n_factura"], name: "n_factura_UNIQUE", unique: true
    t.index ["provider_id"], name: "index_purchase_invoices_on_provider_id"
  end

  create_table "purchases_delivery_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "n_referencia", null: false
    t.float "precio"
    t.datetime "fecha"
    t.string "descripcion"
    t.bigint "construction_id", null: false
    t.bigint "provider_id", null: false
    t.bigint "purchase_invoice_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["construction_id"], name: "index_purchases_delivery_notes_on_construction_id"
    t.index ["n_referencia"], name: "n_referencia_UNIQUE", unique: true
    t.index ["provider_id"], name: "index_purchases_delivery_notes_on_provider_id"
    t.index ["purchase_invoice_id"], name: "index_purchases_delivery_notes_on_purchase_invoice_id"
  end

  create_table "sales_delivery_notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "n_referencia", null: false
    t.float "precio"
    t.datetime "fecha"
    t.string "descripcion"
    t.bigint "construction_id", null: false
    t.bigint "sales_invoice_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["construction_id"], name: "index_sales_delivery_notes_on_construction_id"
    t.index ["n_referencia"], name: "n_referencia_UNIQUE", unique: true
    t.index ["sales_invoice_id"], name: "index_sales_delivery_notes_on_sales_invoice_id"
  end

  create_table "sales_invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "n_referencia", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_sales_invoices_on_client_id"
    t.index ["n_referencia"], name: "n_referencia_UNIQUE", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "dni", null: false
    t.string "telefono"
    t.string "email"
    t.string "direccion"
    t.string "nombre"
    t.float "salario"
    t.string "gremio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dni"], name: "dni_UNIQUE", unique: true
  end

  create_table "working_workers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "construction_id", null: false
    t.bigint "worker_id", null: false
    t.datetime "fecha_ini", null: false
    t.datetime "fecha_fin", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["construction_id"], name: "index_working_workers_on_construction_id"
    t.index ["worker_id"], name: "index_working_workers_on_worker_id"
  end

end
