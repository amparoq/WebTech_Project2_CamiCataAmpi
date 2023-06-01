class AddRequiringUserReffToResponse < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :requiring_user_id, :bigint
    add_foreign_key :responses, :users, column: :requiring_user_id
  end
end
