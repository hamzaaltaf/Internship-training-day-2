class UsersController < ApplicationController
    
    
    
    
    def new
        @students = Student.all
    end

    def update_password
    end
end
