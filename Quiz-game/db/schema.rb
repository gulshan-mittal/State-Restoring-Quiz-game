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

ActiveRecord::Schema.define(version: 20170919222739) do

  create_table "game_states", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quize_id"
    t.integer "Attempt"
    t.boolean "Complete"
    t.integer "Score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quize_id"], name: "index_game_states_on_quize_id"
    t.index ["user_id"], name: "index_game_states_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaderboard_genres", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quize_id"
    t.integer "genre_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_leaderboard_genres_on_genre_id"
    t.index ["quize_id"], name: "index_leaderboard_genres_on_quize_id"
    t.index ["user_id"], name: "index_leaderboard_genres_on_user_id"
  end

  create_table "leaderboard_sub_genres", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quize_id"
    t.integer "sub_genre_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quize_id"], name: "index_leaderboard_sub_genres_on_quize_id"
    t.index ["sub_genre_id"], name: "index_leaderboard_sub_genres_on_sub_genre_id"
    t.index ["user_id"], name: "index_leaderboard_sub_genres_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "Quiz_id"
    t.string "Problem"
    t.string "Choice"
    t.string "Option_A"
    t.string "Option_B"
    t.string "Option_C"
    t.string "Option_D"
    t.string "Correct_Answer"
    t.integer "quize_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_format"
    t.string "stones"
    t.index ["quize_id"], name: "index_questions_on_quize_id"
  end

  create_table "quiz_states", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "MyQuiz_id"
    t.index ["question_id"], name: "index_quiz_states_on_question_id"
    t.index ["user_id"], name: "index_quiz_states_on_user_id"
  end

  create_table "quizes", force: :cascade do |t|
    t.string "name"
    t.integer "subcategory_id"
    t.integer "sub_genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_genre_id"], name: "index_quizes_on_sub_genre_id"
  end

  create_table "sub_genres", force: :cascade do |t|
    t.string "name"
    t.integer "categoryId"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_sub_genres_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "Gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
