class Ticket < ApplicationRecord
    belongs_to :requiring_user
    belongs_to :executive
    has_many :attachments
    has_many :comments
    has_many :responses
    has_many :executive_metrics
    has_many :tags_tickets
    has_many :tags, through: :tags_tickets
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

    before_destroy do
        destroy_dependent_records
        update_executive_assigned_tickets
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

    def destroy_dependent_records
        attachments.destroy_all
        comments.destroy_all
        responses.destroy_all
        executive_metrics.destroy_all
        tags.clear
    end
    
    def update_executive_assigned_tickets
    executive.decrement!(:assigned_tickets)
    end
end