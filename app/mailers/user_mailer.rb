class UserMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    # url we will use in the e-mail view
    @url = 'https://kitten-pixtore-staging.herokuapp.com/'

    # send and select the recipient
    mail(to: @user.email, subject: 'Bienvenue sur Kitten Pixtore !')
  end

end
