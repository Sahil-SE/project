class CreateCasestudyUsers < ActiveRecord::Migration[6.1]
  def change
    #drop_table :casestudy_users
    create_table :casestudy_users do |t|
      t.references :casestudy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :assessor, null: false, index: true, foreign_key: {to_table: :users}


      t.string :status
      t.integer :time_elapsed
      t.datetime :started_time
      t.datetime :completed_time

      t.timestamps
    end
  end
end
