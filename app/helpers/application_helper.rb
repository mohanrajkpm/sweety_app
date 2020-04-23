module ApplicationHelper
	
	#Get report date type
	def report_collection
		{today: 'today_report', 
		 month_to_date: 'month_date', 
		 month_report: 'month_report'}
	end
end
