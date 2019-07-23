class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
  def render_success(data = {})
    p "responding with #{data.inspect}"
        render :json => {
        success: true,
        data: data,
        status: 200
        }
  end

  def render_failure(errors)
    p "responding with #{errors.inspect}"
        render :json => {
            success: false,
            errors: errors,
            status: 200
        }
  end
end
