class ApiTokensController < ApplicationController
  def show
    @api_token = ApiToken.find(params[:id])
    redirect_to root_url if @api_token.displayed
    @api_token.update(displayed: true)
  end

  def create
    resume_session
    user = Current.user

    user.api_token&.destroy

    @api_token = ApiToken.create(user:, expires_at: 15.minutes.from_now)

    redirect_to @api_token
  end
end
