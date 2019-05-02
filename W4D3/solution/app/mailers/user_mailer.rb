class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user
        @url = 'http://aaonline.io'
        mail(to: user.username, subject: 'Welcome to appAcademy')
    end

end
