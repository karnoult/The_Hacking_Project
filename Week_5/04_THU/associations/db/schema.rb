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

ActiveRecord::Schema.define(version: 20171102165823) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "assemblies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assemblies_parts", id: false, force: :cascade do |t|
    t.integer "assembly_id", null: false
    t.integer "part_id", null: false
    t.index ["assembly_id", "part_id"], name: "index_assemblies_parts_on_assembly_id_and_part_id"
    t.index ["part_id", "assembly_id"], name: "index_assemblies_parts_on_part_id_and_assembly_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_users", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "user_id", null: false
    t.index ["category_id", "user_id"], name: "index_categories_users_on_category_id_and_user_id"
    t.index ["user_id", "category_id"], name: "index_categories_users_on_user_id_and_category_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "specialty"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers_followings", id: false, force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.string "string"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "messages_twitters", id: false, force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "twitter_id", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "content"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_tweets_on_author_id"
  end

  create_table "tweets_twitters", id: false, force: :cascade do |t|
    t.integer "tweet_id", null: false
    t.integer "twitter_id", null: false
  end

  create_table "twitters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_videos_on_category_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

end
