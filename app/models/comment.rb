class Comment < ApplicationRecord
    belongs_to :ticket
    belongs_to :executive, class_name: 'User'

    validates :comment, presence: true
    validates :comment, length: { maximum: 500 }
end