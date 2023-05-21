class PagesController < ApplicationController
    def home
        @users = User.all
        @users.each do |user|
            if user.role == "admin"
                @admin = user
                @admin_role = Supervisor.find_by(user_id: user.id)
            elsif user.role == "supervisor"
                @supervisors ||= []
                @supervisors << user
                @supervisors_role ||= []
                @supervisors_role << Supervisor.find_by(user_id: user.id)
            elsif user.role == "executive"
                @executives ||= []
                @executives << user
                @executives_role ||= []
                @executives_role << Executive.find_by(user_id: user.id)
            elsif user.role == "req_user"
                @req_users ||= []
                @req_users << user
                @req_users_role ||= []
                @req_users_role << RequiringUser.find_by(user_id: user.id)
            end
        end
    end
end