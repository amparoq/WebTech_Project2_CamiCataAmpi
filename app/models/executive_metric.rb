class ExecutiveMetric < ApplicationRecord
    belongs_to :executive, class_name: 'User'
    belongs_to :ticket
  end
 