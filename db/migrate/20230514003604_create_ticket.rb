class CreateTicket < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.date :creation_date
      t.date :resolution_date
      t.date :deadline_date
      t.string :title
      t.string :description
      t.integer :priority
      t.string :state

      t.timestamps
    end
  end
end
