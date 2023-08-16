require 'dotenv/load'
require 'nylas'
require 'date'

nylas = Nylas::API.new(
    app_id: ENV["CLIENT_ID"],
    app_secret: ENV["CLIENT_SECRET"],
    access_token: ENV["ACCESS_TOKEN"]
)

today = Date.today
_START = Time.local(today.year, today.month, today.day, 0, 0, 0).strftime("%s")
_END = Time.local(today.year, today.month, today.day, 23, 59, 59).strftime("%s")

events = nylas.events.where(calendar_id: ENV["CALENDAR_ID"],starts_after: _START,ends_before: _END)
                                                               
events.each{ |event|
test = true
	if event.when.start_time
		print(
			"Id: #{event.id} | " \
			"Title: #{event.title} | " \
			"Start: #{event.when.start_time} | " \
			"End: #{event.when.end_time} | " \
			"Participants: ["
			)
	else
		print(
			"Id: #{event.id} | " \
			"Title: #{event.title} | " \
			"Date: #{event.when.date} | " \
			"Participants: ["
			)	
	end		
        event.participants.each{ |participant|
			print (
				"{comment: #{participant.comment}, " \
				"email: #{participant.email}, " \
				"name: #{participant.name}, " \
				"status: #{participant.status}}"
			)
        }
        puts("]\n\n")
}
