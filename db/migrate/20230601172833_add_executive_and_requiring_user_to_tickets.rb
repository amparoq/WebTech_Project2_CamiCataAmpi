class AddExecutiveAndRequiringUserToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :executive_id, :integer
    add_foreign_key :tickets, :users, column: :executive_id

    add_column :tickets, :requiring_user_id, :integer
    add_foreign_key :tickets, :users, column: :requiring_user_id
  end
end
