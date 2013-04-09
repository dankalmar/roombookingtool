class MyMailer < ActionMailer::Base

	def welcome_email(user)
		@user = user

		mail(to: user.email,
			from: 'heather@heatherpayne.ca',
			subject: 'Welcome')
	end

	def event_confirmation(user)
		@user = user

		mail(to: user.email,
			from: 'dan@shoplocket.com',
			subject: 'Your event is booked!')
	end
	
end