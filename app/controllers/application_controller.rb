class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Authorize and redirect to concern page
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.unauthorized_path, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
  # get the beginning month of day
  def beginning_month_of_day ip_date
  	date_parse(ip_date).strftime("%Y-%m-%d")
  end

  # get the end month of day
  def end_month_of_day ip_date
  	date_parse(ip_date).end_of_month.strftime("%Y-%m-%d")
  end

  # parsing date from string
  def date_parse ip_str
	  actual_date = Date.parse(ip_str)
    (Date.new(actual_date.year, actual_date.month))
  end

  protected

    def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :role])
    end
end
