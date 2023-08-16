# Load gems
require 'dotenv/load'
require 'nylas/api'
require 'nylas'

# Initialize Nylas client
nylas = Nylas::Client.new(
	api_key: ENV["V3_TOKEN"]
)

# Query parameters
query_params = {
    calendar_id: ENV["GRANT_ID"]
  }

query_params['start'] = "1692187200" # From 8:00am
query_params['end'] = "1692219600" # To 5:00pm

path_params = {
    grant_id: ENV["GRANT_ID"]
  }

# Read events from our main calendar in the specified date and time
events, _request_ids = nylas.events.list(path_params: path_params, query_params: query_params)

# Loop events
events[:data].each {|event|
	case event[:when][:object]
		when 'timespan'
			start_time = Time.at(event[:when][:start_time])
			end_time = Time.at(event[:when][:end_time])
			event_date = "The time of the event is from: #{start_time} to #{end_time}"
		when 'datespan'
			start_time = event[:when][:start_date]
			end_time = event[:when][:end_date]
			event_date = "The date of the event is from: #{start_time} to: #{end_time}"
		when 'date'
			start_time = event[:when][:date]
			event_date = "The date of the event is: #{start_time} "
		end
		participant_details = ""
		event[:participants].each {|participant|
			participant_details = "Email: #{participant[:email]} Name: #{participant[:email]} Status: #{participant[:status]}"
		}
		puts "Id: #{event[:id]} | Title: #{event[:title]} | #{event_date} | Participants: #{participant_details}"
		puts "\n"
}
