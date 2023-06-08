class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    validates :email, uniqueness: true
    validates :email, presence: true
    validate :only_one_administrator
    has_many :executive_tickets, class_name: 'Ticket', foreign_key: 'executive_id'
    has_many :requiring_user_tickets, class_name: 'Ticket', foreign_key: 'requiring_user_id'
    has_many :executive_metrics, class_name: 'ExecutiveMetric', foreign_key: 'executive_id'
    has_many :executive_responses, class_name: 'Response', foreign_key: 'executive_id'
    has_many :requiring_user_responses, class_name: 'Response', foreign_key: 'requiring_user_id'

    attribute :role, :integer, default: 0

    enum role: {
        requiring_user: 0,
        executive: 1,
        supervisor: 2,
        administrator: 3
    }

    private
    def only_one_administrator
        if role == "administrator"
            if User.exists?(role: "administrator")
                errors.add(:role, 'there can only be one admin')
            end
        end
    end

end