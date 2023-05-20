class Ticket < ApplicationRecord
    belongs_to :requiring_user
    belongs_to :executive
    has_and_belongs_to_many :tags
    has_many :attachments 
    has_many :comments
    has_many :responses

    after_create do
        self.executive.assigned_tickets += 1
        self.executive.save
    end
    #Poner un validator que vea que la fecha de resolution sea mayor a la de creation (si no, no tendría sentido)
end