class Supervisor < ApplicationRecord
    belongs_to :user
    #Ver cómo hacer que solo uno tenga True en la variable administrator
end