class Response < ApplicationRecord
    belongs_to :ticket
    belongs_to :executive, class_name: 'User'
    belongs_to :requiring_user, class_name: 'User'
    
    after_create do
        if evaluation.present?
            create_executive_metric
        end
    end

    after_update do
        if evaluation.present?
            create_executive_metric
        end
    end

    private
    def create_executive_metric
        ExecutiveMetric.create(date: Date.today, type_of_metric: "Evaluation", evaluation: self.evaluation, executive_id: self.executive_id, ticket_id: self.ticket_id)
    end

end