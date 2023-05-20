class Executive < ApplicationRecord
    has_many :executive_metrics
    belongs_to :user
    has_many :comments
    has_many :tickets
    has_many :responses

    before_save :init

    def init
      self.assigned_tickets ||= 0
    end
end