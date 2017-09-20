class AddMyQuizIdToQuizState < ActiveRecord::Migration[5.1]
  def change
    add_column :quiz_states, :MyQuiz_id, :integer
  end
end
