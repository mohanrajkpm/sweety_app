class GlucoseLevelsController < ApplicationController
	before_action :authenticate_user!

	def new
		@glucose_level = GlucoseLevel.new
	end
	
	def index
		@glucose_levels = GlucoseLevel.where(user_id: current_user.id)
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