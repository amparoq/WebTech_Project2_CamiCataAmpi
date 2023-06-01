class AddExecutiveReffToResponse < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :executive_id, :bigint
    add_foreign_key :responses, :users, column: :executive_id
  end
end
