class AddFileFormatToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :file_format, :string
  end
end
