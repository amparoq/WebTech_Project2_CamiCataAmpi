class RequiringUser < ApplicationRecord
    belongs_to :user
    has_many :tickets, dependent: :destroy
    has_many :responses
end