class Comment < ApplicationRecord
    belongs_to :ticket
    belongs_to :executive, class_name: 'User'
end