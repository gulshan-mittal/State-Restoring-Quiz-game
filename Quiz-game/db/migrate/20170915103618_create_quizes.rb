class CreateQuizes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizes do |t|
      t.string :name
      t.integer :subcategory_id
      t.references :sub_genre, foreign_key: true

      t.timestamps
    end
  end
end
