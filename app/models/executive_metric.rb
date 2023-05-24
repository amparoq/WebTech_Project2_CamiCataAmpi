class ExecutiveMetric < ApplicationRecord
    belongs_to :executive
    belongs_to :ticket
  
    scope :by_executive, ->(executive_id) { where(executive_id: executive_id) }
    scope :by_month, ->(month) { where(date: month.beginning_of_month..month.end_of_month) }
    scope :open_tickets, -> { joins(:ticket).where(tickets: { state: 'open' }) }
    scope :closed_tickets, -> { joins(:ticket).where(tickets: { state: 'closed' }) }
  
    enum priority: { high: 0, medium: 1, low: 2 }
  end
 