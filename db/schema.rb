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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101003150744) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packets", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "packets", ["user_id"], :name => "index_packets_on_user_id"

  create_table "survey_packets", :id => false, :force => true do |t|
    t.integer "survey_id"
    t.integer "packet_id"
  end

  add_index "survey_packets", ["packet_id"], :name => "survey_packets_packet_id_fk"
  add_index "survey_packets", ["survey_id", "packet_id"], :name => "index_surveys_packets_on_survey_id_and_packet_id"

  create_table "survey_questions", :force => true do |t|
    t.integer  "survey_taken_id"
    t.integer  "order"
    t.integer  "word_id"
    t.string   "answer"
    t.boolean  "is_correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_questions", ["survey_taken_id"], :name => "index_survey_questions_on_survey_taken_id"
  add_index "survey_questions", ["word_id"], :name => "index_survey_questions_on_word_id"

  create_table "survey_takens", :force => true do |t|
    t.integer  "survey_id"
    t.float    "score"
    t.integer  "nr_correct"
    t.integer  "nr_questions"
    t.integer  "current_question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_takens", ["survey_id"], :name => "index_survey_takens_on_survey_id"

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["user_id"], :name => "index_surveys_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "fullname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "words", :force => true do |t|
    t.string   "original"
    t.string   "translation"
    t.integer  "packet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "survey_packets", "packets", :name => "survey_packets_packet_id_fk"
  add_foreign_key "survey_packets", "surveys", :name => "survey_packets_survey_id_fk"

  add_foreign_key "survey_questions", "survey_takens", :name => "survey_questions_survey_taken_id_fk"

  add_foreign_key "survey_takens", "surveys", :name => "survey_takens_survey_id_fk"

end
