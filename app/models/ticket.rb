class Ticket < ApplicationRecord
    belongs_to :requiring_user
    belongs_to :executive
    has_and_belongs_to_many :tags
    has_many :attachments 
    has_many :comments
    has_many :responses
end