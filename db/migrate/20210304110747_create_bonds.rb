class CreateBonds < ActiveRecord::Migration[5.2]
  def change
    create_table :bonds do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.boolean :state, null: false, default: false

      t.timestamps
    end

    add_index :bonds, [:user_id, :friend_id], unique: true
    add_foreign_key :bonds, :users, column: :user_id
    add_foreign_key :bonds, :users, column: :friend_id
  end
end