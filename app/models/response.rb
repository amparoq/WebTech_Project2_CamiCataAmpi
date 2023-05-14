class Response < ApplicationRecord
    belongs_to :ticket
    belongs_to :executive
    belongs_to :requiring_user
end