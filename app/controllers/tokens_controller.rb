class TokensController < ApplicationController
  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)

    if @token.valid? && @token.login!
      # Render view with access token
    elsif @token.valid?
      # Credentials no good or API borked
      @token.errors.add(:password, "Uh-oh, Tesla didn't return an access token for these credentials.")
      render :new
    else
      render :new
    end
  end

protected

  def token_params
    params.require(:token).permit(:email, :password)
  end
end
