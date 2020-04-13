class GlucoseLevelsController < ApplicationController
	before_action :authenticate_user!

	def new
		@glucose_level = GlucoseLevel.new
	end
	
	def index
		conditions = ''
		if params[:search] && params[:search][:report_type] && params[:search][:report_date].present?
			report_type = params[:search][:report_type]
			report_date = params[:search][:report_date]
			if report_type == helpers.report_collection[:Today]
				conditions = ["Date(created_at) = '#{report_date}'"]
			elsif report_type == helpers.report_collection[:"Month to date"]
				month_of_day = beginning_month_of_day report_date
				conditions = ["Date(created_at) BETWEEN '#{month_of_day}' AND '#{report_date}' "]
			elsif report_type == helpers.report_collection[:"Month report"]
				beginning_of_day = beginning_month_of_day report_date	
				end_of_day = end_month_of_day report_date 
				conditions = ["Date(created_at) BETWEEN '#{beginning_of_day}' AND '#{end_of_day}' "]
			end	
		else
			@glucose_levels = GlucoseLevel.where(user_id: current_user.id)

		end

		@glucose_levels = GlucoseLevel.where(user_id: current_user.id).where(conditions)
		
		respond_to do |format|
			format.html
			format.js { 
				render 'list'
			 }
    end
	end

	def create
		@glucose_levels = GlucoseLevel.new(glucose_level_params)
		if @glucose_levels.save
			flash[:notice] = t('common.created_successfully', model_name: "Glucose level")
			redirect_to new_glucose_level_path
		else
			flash[:errors] = @glucose_levels.errors.full_messages
	  redirect_to new_glucose_level_path
		end
	end

	private
		# permit the glucose level params
    def glucose_level_params
  		params.require(:glucose_level).permit(:glucose).merge(user_id: current_user.id)
		end
end