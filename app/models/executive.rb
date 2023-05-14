class Executive < ApplicationRecord
    belongs_to :executive_metrics
    belongs_to :user
    has_many :comments
    has_many :tickets
    has_many :responses
end