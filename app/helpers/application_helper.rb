module ApplicationHelper
	def report_collection
		{'Today': 'today_report', 
		 'Month to date': 'month_date', 
		 'Month report': 'month_report'}
	end

	def glucose_max_level obj
		get_glucose_levels(obj).max
	end

	def glucose_min_level obj
		get_glucose_levels(obj).min
	end

	def glucose_avg_level obj
		arr = get_glucose_levels(obj)
		sum = 0
		sum = arr.inject{|sum, x| sum + x}
		avg = sum / arr.length
	end

	def get_glucose_levels obj
		obj.map(&:glucose)
	end
end
