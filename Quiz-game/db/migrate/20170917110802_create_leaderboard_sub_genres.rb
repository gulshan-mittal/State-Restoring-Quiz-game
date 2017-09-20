class CreateLeaderboardSubGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboard_sub_genres do |t|
      t.references :user, foreign_key: true
      t.references :quize, foreign_key: true
      t.references :sub_genre, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
