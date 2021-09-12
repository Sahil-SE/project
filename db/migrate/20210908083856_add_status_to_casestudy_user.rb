class AddStatusToCasestudyUser < ActiveRecord::Migration[6.1]
  def change
    add_column :casestudy_users, :status, :integer
  end
end
