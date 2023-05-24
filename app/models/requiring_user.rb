class RequiringUser < ApplicationRecord
    belongs_to :user
    has_many :tickets
    has_many :responses

    before_destroy do
        destroy_dependant
    end

    private
    def destroy_dependant
        tickets.destroy_all
    end
end