class CreateResponse < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :response
      t.boolean :acceptance
      t.integer :evaluation

      t.timestamps
    end
  end
end
