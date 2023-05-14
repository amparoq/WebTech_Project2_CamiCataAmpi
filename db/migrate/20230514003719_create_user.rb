class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :telephone
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
