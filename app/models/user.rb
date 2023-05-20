class User < ApplicationRecord
    has_many :requiring_users
    has_many :executives
    has_many :supervisors

    validates :email, uniqueness: true
    validates :email, presence: true
end