class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Konto aktivieren"
  end

  def password_reset
    @greeting = "Hallo"

    mail to: "to@example.org", subject: "Passwort zurücksetzen"
  end
end
