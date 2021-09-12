class RemoveStatusFromCasestudyUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :casestudy_users, :status
  end
end
