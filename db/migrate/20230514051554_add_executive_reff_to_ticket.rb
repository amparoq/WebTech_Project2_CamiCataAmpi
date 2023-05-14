class AddExecutiveReffToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :executive, null: false, foreign_key: true
  end
end
