class AddExecutiveReffToResponse < ActiveRecord::Migration[7.0]
  def change
    add_reference :responses, :executive, null: false, foreign_key: true
  end
end
