class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Ich habe Ihnen für die Änderung Ihres Passwortes einen Link gesendet."
      redirect_to root_url
    else
      flash.now[:danger] = "E-Mail Adresse nicht gefunden"
      render 'new'
    end
  end

  def edit
  end
end
