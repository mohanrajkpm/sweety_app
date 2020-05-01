module Filterable
    extend ActiveSupport::Concern

    module ClassMethods
        def filter(params, report_collection)
        
            conditions = ''
            if params[:search] && params[:search][:report_type] && params[:search][:report_date].present?
                report_type = params[:search][:report_type]
                report_date = params[:search][:report_date]
                if report_type == report_collection[:today]
                    conditions = ["Date(created_at) = '#{report_date}'"]
                elsif report_type == report_collection[:month_to_date]
                    month_of_day = beginning_month_of_day report_date
                    conditions = ["Date(created_at) BETWEEN '#{month_of_day}' AND '#{report_date}' "]
                elsif report_type == report_collection[:month_report]
                    beginning_of_day = beginning_month_of_day report_date	
                    end_of_day = end_month_of_day report_date 
                    conditions = ["Date(created_at) BETWEEN '#{beginning_of_day}' AND '#{end_of_day}' "]
                end
            end
            results = self.where(nil)
            user = User.find(params[:user_id])
            if user.has_role?('doctor')
                results.where(conditions)
            else
                results.where(user_id: params[:user_id]).where(conditions)
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
    end
end