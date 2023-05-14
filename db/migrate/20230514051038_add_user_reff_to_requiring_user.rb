class AddUserReffToRequiringUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :requiring_users, :user, null: false, foreign_key: true
  end
end
