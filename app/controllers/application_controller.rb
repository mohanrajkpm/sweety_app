class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  # get the beginning month of day
  def beginning_month_of_day ip_date
  	actual_date = date_parse(ip_date)
  	(Date.new(actual_date.year, actual_date.month)).strftime("%Y-%m-%d")
  end

  # get the end month of day
  def end_month_of_day ip_date
  	actual_date = date_parse(ip_date)
  	(Date.new(actual_date.year, actual_date.month)).end_of_month.strftime("%Y-%m-%d")
  end

  # parsing date from string
  def date_parse ip_str
	Date.parse(ip_str)
  end

  protected

    def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :email, :password])
    end
end
