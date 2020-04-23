class GlucoseLevelsController < ApplicationController
	load_and_authorize_resource
	
	#Render new page
	#
	#Displaying new book page
	def new
		@glucose_level = GlucoseLevel.new
	end
	
	#Render index page
	#
	#Displaying all books
	def index
		@glucose_levels = GlucoseLevel.filter(params.slice(:search).merge(user_id: current_user.id), helpers.report_collection)
		respond_to do |format|
			format.html
			format.js { 
				render 'list'
			 }
    end
	end

	#Create a book.
	#
	#Create a book.
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