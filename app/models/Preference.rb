class Preference
  MAX_CREDIT = 15.0
  MIN_CREDIT = 1.5
  attr_accessor :day, :time, :credits
  def initialize(day, time, credits)
    @day = {monday: false, tuesday: false, wednesday: false, thrusday: false, friday: false}
    update_day(day)
    @time = {morning: false, evening: false, afternoon: false}
    update_time(time)
    @credits = validate_credit(credits.to_f)
  end

  def update_day(day)
    if day == "all"
      @day.each do |key, value|
        @day[key] = true
      end
    else
      day.each do |key|
        @day[key.downcase.to_sym] = true
      end
    end
  end

  def update_time(time)
    if time == "all"
      @time.keys.each do |key|
        @time[key] = true
      end
    else
      time.each do |time_option|
        @time[time_option.downcase.to_sym] = true
      end
    end
  end

  def validate_credit(credit)
    return MAX_CREDIT if credit >= MAX_CREDIT
    return MIN_CREDIT if credit <= MIN_CREDIT
    return credit - credit%0.5
  end
end
