class Ticket < ApplicationRecord
    belongs_to :requiring_user
    belongs_to :executive
    has_and_belongs_to_many :tags
    has_many :attachments 
    has_many :comments
    has_many :responses
    has_many :executive_metrics
    validate :resolution_date_greater_than_creation_date

    after_create do
        creation_executive_metric
        opened_or_closed_executive_metric
        self.executive.assigned_tickets += 1
        self.executive.save
    end

    before_update do
        if state_changed? && state_was == "open" && state == "closed"
            change_metric
        end
        if state_changed? && state_was == "closed" && state == "reopened"
            change_metric_reopened
        end
    end

    before_edit do
        if state_changed? && state_was == "open" && state == "closed"
            change_metric
        end
        if state_changed? && state_was == "closed" && state == "reopened"
            change_metric_reopened
        end
    end

    private
    def resolution_date_greater_than_creation_date
        return unless resolution_date && creation_date
    
        errors.add(:resolution_date, "Resolution date must be greater than creation date") if resolution_date <= creation_date
    end

    def creation_executive_metric
        ExecutiveMetric.create(executive_id: self.executive_id, date: Date.today, type_of_metric: "create")
    end

    def opened_or_closed_executive_metric
        if state == "open"
            ExecutiveMetric.create(executive_id: self.executive_id, date: Date.today, type_of_metric: "open", ticket_id: self.id)
        end
        if state == "closed"
            ExecutiveMetric.create(executive_id: self.executive_id, date: Date.today, type_of_metric: "closed", ticket_id: self.id)
        end
    end

    def change_metric
        ex = ExecutiveMetric.find_by(ticket_id: self.ticket_id)
        ex.update(type_of_metric: "closed") if ex.present?
    end

    def change_metric_reopened
        ex = ExecutiveMetric.find_by(ticket_id: self.ticket_id)
        ex.update(type_of_metric: "reopened") if ex.present?
    end
end