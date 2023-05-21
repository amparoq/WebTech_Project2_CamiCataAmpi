class Supervisor < ApplicationRecord
    belongs_to :user
    validate :only_one_administrator
  
    private
  
    def only_one_administrator
      return unless administrator
  
      if Supervisor.where(administrator: true).where.not(id: id).exists?
        errors.add(:administrator, "Only one supervisor can have administrator role")
      end
    end
  end