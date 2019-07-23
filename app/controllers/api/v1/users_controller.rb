class Api::V1::UsersController < ApplicationController
    before_action :set_user, except: [:create, :index]

    def index
        @students = Student.all
        return render_success({students: @students.as_json(only: [:id, :name, :email])})
    end

    def create
        return render_failure(['Name required']) if params[:name].blank?
        return render_failure(['Email required']) if params[:email].blank?
        @student = Student.create(name: params[:name], email: params[:email])
        if @student.persisted?
            return render_success({student: success_user_resp})
        else
            return render_failure(failed_user_response)
        end
    end 

    def update
        updated = @student.update(name: params[:name])
        if updated == true
            return render_success({student: success_user_resp})
        else
            return render_failure(failed_user_response)
        end
    end

    def destroy
        if @student.destroy
            return render_success()
        else
            return render_failure(failed_user_response)
        end
    end

    private

    def success_user_resp
        @student.as_json(only: [:id, :email, :name])
    end

    def failed_user_response
        @student.errors.full_messages[0]
    end

    def set_user
        return render_failure(['Name required']) if params[:name].blank?
        @student = Student.find_by_id(params[:id])
        return render_failure(['Invalid Student ID']) if @student.blank?
    end

end
