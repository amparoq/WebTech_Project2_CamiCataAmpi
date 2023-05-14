class CreateExecutive < ActiveRecord::Migration[7.0]
  def change
    create_table :executives do |t|
      t.integer :assigned_tickets

      t.timestamps
    end
  end
end
