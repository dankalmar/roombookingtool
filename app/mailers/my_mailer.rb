class MyMailer < ActionMailer::Base

	def welcome_email(user)
		@user = user

		mail(to: user.email,
			from: 'roombookingapp@gmail.com',
			subject: 'Welcome')
	end

	def event_confirmation(user)
		@user = user

		mail(to: user.email,
			from: 'roombookingapp@gmail.com',
			subject: 'Your event is booked!')
	end
	
end