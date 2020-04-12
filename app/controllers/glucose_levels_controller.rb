class GlucoseLevelsController < ApplicationController
	before_action :authenticate_user!
	def new
		@glucose_level = GlucoseLevel.new
	end
end