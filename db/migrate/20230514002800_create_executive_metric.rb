class CreateExecutiveMetric < ActiveRecord::Migration[7.0]
  def change
    create_table :executive_metrics do |t|
      t.date :date
      t.string :type_of_metric
      t.integer :evaluation

      t.timestamps
    end
  end
end
