class MyMailer < ActionMailer::Base

	def welcome_email(user)
		@user = user

		mail(to: user.email,
			from: 'heather@heatherpayne.ca',
			subject: 'Welcome')
	end

end