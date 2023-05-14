class AddRequiringUserReffToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :requiring_user, null: false, foreign_key: true
  end
end
