class AddTitleToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :tile, :string, before: :body

  end
end
