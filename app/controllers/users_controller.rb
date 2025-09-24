class UsersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    User.create(params.permit(:email_address, :password))

    redirect_to session_url
  end

  def show
    resume_session
    @user = Current.user
  end
end
