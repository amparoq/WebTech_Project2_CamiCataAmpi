class PagesController < ApplicationController
    def home
        if current_user.requiring_user?
            @tickets = current_user.requiring_user_tickets
            @opened_tickets = @tickets.where(state: "open")
            @pending_responses = current_user.requiring_user_responses.where(acceptance: false, rejected: false)
        end
        if current_user.executive?
            @tickets = current_user.executive_tickets
            @opened_tickets = @tickets.where(state: "open")
            @evaluation_average = ExecutiveMetric.where(type_of_metric: "Evaluation").group(:executive_id).average(:evaluation)
            @pending_responses = current_user.executive_responses.where(acceptance: false, rejected: false)
            @tickets_no_answer = @tickets.select { |ticket| ticket.state == "open" && !ticket.responses.any? }
        end
        if current_user.supervisor? || current_user.administrator?
            @tickets = Ticket.all
            @opened_tickets = @tickets.where(state: "open")
            @tickets_no_answer = @tickets.select { |ticket| ticket.state == "open" && !ticket.responses.any? }
            @overdue_tickets = @tickets.where('(resolution_date IS NULL AND deadline_date < ?) OR (resolution_date IS NOT NULL AND deadline_date < resolution_date)', Date.today).order(deadline_date: :asc)
        end
    end
end