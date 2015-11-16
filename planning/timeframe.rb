require 'pry'
idea_start = '2015-01-01'
idea_end = '2015-01-31'
response_start = '2015-01-10'
response_end = '2015-01-15'
r2_start = '2015-01-05'
r2_end = '2015-01-13'

# idea_array = []
# (idea_start..idea_end).each do |day|
#   idea_array << day
# end
#
# response_array = []
# (response_start..response_end).each do |day|
#   response_array << day
# end
#
# result_array = idea_array & response_array

result_array = (idea_start..idea_end).to_a
responses.each do |response|
  result_array = result_array & (response_start..response_end).to_a
end

@user = User.all

optimal_dates = (@escapade.start_date..@escapade.end_date).to_a
@user.each do |user|
  user_availability = []
  (@user.responses & @escapade.responses).each do |response|
    user_availability = user_availability + (response.start_date..response.end_date).to_a
  end
  optimal_dates = optimal_dates & user_availability.sort!

end


<% optimal_dates = (@escapade.start_date..@escapade.end_date).to_a %>
<% @responses.each do |response| %>
<% optimal_dates = optimal_dates & (response.start_date..response.end_date).to_a %>
<% end %>
<p><%= "#{optimal_dates.first} - #{optimal_dates.last}" %></p>

binding.pry

puts "the end"
