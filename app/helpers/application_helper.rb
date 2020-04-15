module ApplicationHelper
	
	#Get report date type
	def report_collection
		{'Today': 'today_report', 
		 'Month to date': 'month_date', 
		 'Month report': 'month_report'}
	end

	#Get glucose maximum level
	def glucose_max_level obj
		get_glucose_levels(obj).max
	end

	#Get glucose minimum level
	def glucose_min_level obj
		get_glucose_levels(obj).min
	end

	#Get glucose average level
	def glucose_avg_level obj
		arr = get_glucose_levels(obj)
		sum = 0
		sum = arr.inject{|sum, x| sum + x}
		avg = sum / arr.length
	end

	#Get glucose level
	def get_glucose_levels obj
		obj.map(&:glucose)
	end
end
