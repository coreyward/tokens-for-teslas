class TokensController < ApplicationController
  def new
    @token = Token.new
  end

  def create
    @token = Token.new(token_params)

    if @token.valid?
      @token.login!
    else
      render :new
    end
  end

protected

  def token_params
    params.require(:token).permit(:email, :password)
  end
end
