class AddRequiringUserReffToResponse < ActiveRecord::Migration[7.0]
  def change
    add_reference :responses, :requiring_user, null: false, foreign_key: true
  end
end
