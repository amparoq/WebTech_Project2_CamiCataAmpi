class CreateSupervisor < ActiveRecord::Migration[7.0]
  def change
    create_table :supervisors do |t|
      t.boolean :administrator

      t.timestamps
    end
  end
end
