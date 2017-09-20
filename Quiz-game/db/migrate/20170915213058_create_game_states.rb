class CreateGameStates < ActiveRecord::Migration[5.1]
  def change
    create_table :game_states do |t|
      t.references :user, foreign_key: true
      t.references :quize, foreign_key: true
      t.integer :Attempt
      t.boolean :Complete
      t.integer :Score

      t.timestamps
    end
  end
end
