class AddExecutiveReffToComment < ActiveRecord::Migration[7.0]
    def change
      add_column :comments, :executive_id, :integer
      add_foreign_key :comments, :users, column: :executive_id
    end
end
