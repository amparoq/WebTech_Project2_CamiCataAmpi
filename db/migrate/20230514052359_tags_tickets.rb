class TagsTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tags_tickets, :id => false do |t|
      t.integer :tag_id
      t.integer :ticket_id
    end
  end
end