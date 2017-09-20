class AddStonesToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :stones, :string
  end
end
