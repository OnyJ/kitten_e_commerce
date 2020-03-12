class UserMailer < ApplicationMailer
  default from: 'info@kitten-pixtore.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    # url we will use in the e-mail view
    @url = 'https://kitten-pixtore-staging.herokuapp.com/'

    # send and select the recipient
    mail(to: @user.email, subject: 'Bienvenue sur Kitten Pixtore !')
  end

  def purchased_email(user)
    @user = user
    # url we will use in the e-mail view
    @url = 'https://kitten-pixtore-staging.herokuapp.com/'
    mail(to: @user.email, subject: "Votre achat Kitten Pixtore ! \u{1f638}")
  end

  def sold_email(user)
    @user = user
    @url = 'https://kitten-pixtore-staging.herokuapp.com/'
    mail(to: @user.email, subject: "Une commande a été effectuée sur Kitten Pixtore ! \u{1f638}")
  end
  


end
