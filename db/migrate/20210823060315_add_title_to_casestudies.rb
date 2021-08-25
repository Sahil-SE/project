class AddTitleToCasestudies < ActiveRecord::Migration[6.1]
  def change
    add_column :casestudies, :tile, :string, before: :duration
  end
end
