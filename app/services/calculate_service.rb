class CalculateService
    def cal_glucose_revision obj
        results = {max_glucose: glucose_max_level(obj), min_glucose: glucose_min_level(obj), avg_glucose: glucose_avg_level(obj) }
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
        sum, avg = 0, 0
        sum = arr.inject{|sum, x| sum + x}
        avg = sum / arr.length if arr.length > 0
    end

    #Get glucose level
    def get_glucose_levels obj
        obj.map(&:glucose)
    end
end