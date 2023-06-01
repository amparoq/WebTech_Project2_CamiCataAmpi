class AddExecutiveReffToExecutiveMetric < ActiveRecord::Migration[7.0]
  def change
    add_column :executive_metrics, :executive_id, :bigint
    add_foreign_key :executive_metrics, :users, column: :executive_id
  end
end
