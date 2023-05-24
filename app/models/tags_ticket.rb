class TagsTicket < ApplicationRecord
    belongs_to :ticket
    belongs_to :tag
end
  