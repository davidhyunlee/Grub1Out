class UserMailer < ApplicationMailer
    default from: 'jeryl.barnum@gmail.com'

    def welcome_email(user)
        @user = user
        @url = "http://gruubit.herokuapp.com"
        mail(to: @user.email, subject: 'Welcome to grubIt')
    end
end
