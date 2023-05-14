class RequiringUser < ApplicationRecord
    belongs_to :user
    has_many :tickets
    has_many :responses
end