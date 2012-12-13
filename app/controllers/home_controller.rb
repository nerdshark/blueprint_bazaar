class HomeController < ApplicationController
    skip_before_filter :require_login, :only => [:marketing]
    def index
        #@projects = Project.where(:created_at.gte => Date::today)
        @projects = Project.all
        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @projects }
        end
    end
    def marketing
        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: none }
        end
    end
end
