class AddTitleToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :tile, :string, before: :body
  end
end
