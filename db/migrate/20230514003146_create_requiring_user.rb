class CreateRequiringUser < ActiveRecord::Migration[7.0]
  def change
    create_table :requiring_users do |t|

      t.timestamps
    end
  end
end
