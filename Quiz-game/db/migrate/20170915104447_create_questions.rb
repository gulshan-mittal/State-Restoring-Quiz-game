class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :Quiz_id
      t.string :Problem
      t.string :Choice
      t.string :Option_A
      t.string :Option_B
      t.string :Option_C
      t.string :Option_D
      t.string :Correct_Answer
      t.references :quize, foreign_key: true

      t.timestamps
    end
  end
end
