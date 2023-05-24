class Executive < ApplicationRecord
  has_many :executive_metrics
  belongs_to :user
  has_many :comments
  has_many :tickets
  has_many :responses

  before_save :init
  before_destroy do
    destroy_dependant
  end

  private
  def init
    self.assigned_tickets ||= 0
  end

  def total_tickets_received_in_month(month)
    executive_metrics.by_month(month).count
  end

  def total_open_tickets_in_month(month)
    executive_metrics.by_month(month).open_tickets.count
  end

  def total_closed_tickets_in_month(month)
    executive_metrics.by_month(month).closed_tickets.count
  end

  def open_tickets_by_priority_in_month(month)
    executive_metrics.by_month(month).open_tickets.group(:priority).count
  end

  def closed_tickets_by_priority_in_month(month)
    executive_metrics.by_month(month).closed_tickets.group(:priority).count
  end

  def destroy_dependant
    comments.destroy_all
    tickets.destroy_all
    responses.destroy_all
    executive_metrics.destroy_all
  end
    
end