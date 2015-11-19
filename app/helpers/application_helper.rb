module ApplicationHelper

  def get_optimal_dates escapade
    optimal_dates = (escapade.start_date..escapade.end_date).to_a
    escapade.responses.each do |response|
      user_availability = []
      response.availabilities.each do |availability|
        user_availability = user_availability + (availability.start_date..availability.end_date).to_a
      end
      optimal_dates = optimal_dates & user_availability unless user_availability.empty?
    end
    optimal_dates = optimal_dates.reject do |i|
      optimal_dates.include?(i-1) & optimal_dates.include?(i+1)
    end
    optimal_dates = optimal_dates.each_slice(2).to_a
  end

  def format_date date
    date.strftime('%B %-d, %Y')
  end

end
