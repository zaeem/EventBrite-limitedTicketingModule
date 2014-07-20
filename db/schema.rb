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

ActiveRecord::Schema.define(version: 20140407204842) do

  create_table "addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "address_type"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "affiliate_details", force: true do |t|
    t.integer  "user_id"
    t.integer  "percentage"
    t.decimal  "flat_fee",            precision: 8, scale: 2
    t.string   "commissionable_type"
    t.decimal  "payment_threshold",   precision: 8, scale: 2
    t.boolean  "locked"
    t.string   "payment_method"
    t.string   "affiliate_token"
    t.boolean  "token_active"
    t.boolean  "payments_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "affiliate_payments", force: true do |t|
    t.integer  "user_id"
    t.decimal  "amount",         precision: 8, scale: 2
    t.string   "affiliate_type"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "affiliate_payments_sales", force: true do |t|
    t.integer  "affiliate_payment_id"
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auth_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auth_users", ["email"], name: "index_auth_users_on_email", unique: true, using: :btree
  add_index "auth_users", ["reset_password_token"], name: "index_auth_users_on_reset_password_token", unique: true, using: :btree

  create_table "bid_ticket_types", force: true do |t|
    t.integer  "bid_id"
    t.integer  "ticket_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bids", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "venue_group_id"
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "quantity"
    t.decimal  "proxy",              precision: 8, scale: 2
    t.datetime "expires_at"
    t.boolean  "cancel_others"
    t.string   "status"
    t.date     "in_hand_date"
    t.boolean  "is_negotiation"
    t.date     "expected_ship_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broker_details", force: true do |t|
    t.integer  "user_id"
    t.integer  "kickback_percentage"
    t.decimal  "kickback_flat_fee",    precision: 8, scale: 2
    t.string   "kickback_type"
    t.integer  "reduction_percentage"
    t.decimal  "reduction_flat_fee",   precision: 8, scale: 2
    t.string   "reduction_type"
    t.decimal  "payment_threshold",    precision: 8, scale: 2
    t.boolean  "locked"
    t.string   "payment_method"
    t.boolean  "payments_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broker_payments", force: true do |t|
    t.decimal  "amount",       precision: 8, scale: 2
    t.string   "payment_type"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broker_payments_sales", force: true do |t|
    t.integer  "broker_payment_id"
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupon_codes", force: true do |t|
    t.string   "code"
    t.string   "discount_type"
    t.decimal  "amount",        precision: 8, scale: 2
    t.integer  "quantity"
    t.datetime "starts_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", force: true do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "number"
    t.integer  "expiration_month"
    t.integer  "expiration_year"
    t.integer  "ccv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disclosures", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_disclosures", force: true do |t|
    t.integer  "event_id"
    t.integer  "disclosure_id"
    t.string   "venue_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "venue_id"
    t.string   "name"
    t.datetime "event_date"
    t.text     "description"
    t.boolean  "primary"
    t.string   "primary_pdf"
    t.string   "seatgeek_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "negotiation_logs", force: true do |t|
    t.integer  "bid_id"
    t.integer  "offer_id"
    t.decimal  "price",            precision: 8, scale: 2
    t.integer  "quantity"
    t.string   "negotiation_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer_disclosures", force: true do |t|
    t.integer  "offer_id"
    t.integer  "disclosure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer_tickets", force: true do |t|
    t.integer  "offer_id"
    t.integer  "venue_row_id"
    t.string   "status"
    t.integer  "seat_number"
    t.string   "barcode"
    t.string   "attendee_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "venue_group_id"
    t.integer  "ticket_type_id"
    t.decimal  "price",               precision: 8, scale: 2
    t.integer  "quantity"
    t.decimal  "proxy",               precision: 8, scale: 2
    t.integer  "multiple"
    t.boolean  "cancel_others"
    t.string   "status"
    t.date     "in_hand_date"
    t.date     "expected_ship_date"
    t.boolean  "is_negotiation"
    t.datetime "expires_at"
    t.boolean  "confirm_transaction"
    t.boolean  "piggy_backed"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "sale_id"
    t.string   "payment_type"
    t.decimal  "amount",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "bid_id"
    t.integer  "offer_id"
    t.integer  "ticket_status_id"
    t.integer  "quantity"
    t.decimal  "price",            precision: 8, scale: 2
    t.integer  "affiliate_id"
    t.string   "payment_status"
    t.integer  "coupon_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploaded_tickets", force: true do |t|
    t.integer  "offer_ticket_id"
    t.binary   "ticket_file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: true do |t|
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "phone"
    t.string   "phone_daytime"
    t.string   "phone_evening"
    t.string   "phone_cell"
    t.string   "security_question1"
    t.string   "security_answer1"
    t.boolean  "subscribe"
    t.integer  "sale_commission"
    t.integer  "negotiation_commission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_events", force: true do |t|
    t.integer  "event_id"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_groups", force: true do |t|
    t.string   "name"
    t.integer  "rating"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_rows", force: true do |t|
    t.integer  "venue_section_id"
    t.integer  "venue_group_id"
    t.string   "name"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_sections", force: true do |t|
    t.integer  "venue_id"
    t.string   "raphael_date"
    t.string   "color"
    t.string   "section_text"
    t.string   "section_number"
    t.integer  "row_start"
    t.integer  "row_end"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "category"
    t.string   "subcategory"
    t.string   "name"
    t.string   "team"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.text     "description"
    t.string   "school"
    t.string   "team_name"
    t.string   "mascot"
    t.string   "seatgeek_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
