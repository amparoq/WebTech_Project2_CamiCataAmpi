class Tag < ApplicationRecord
    has_many :tags_tickets
    has_many :tickets, through: :tags_tickets
  end  
