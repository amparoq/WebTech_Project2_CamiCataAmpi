class PagesController < ApplicationController
    def home
        @admin = User.administrator[0]
        @supervisors = User.supervisor
        @executives = User.executive
        @req_users = User.requiring_user
    end
end