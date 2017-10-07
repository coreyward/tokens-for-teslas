class Token
  include ActiveModel::Model

  attr_accessor :email, :password
  attr_reader :token, :expiration

  validates :email, :password, presence: true

  def initialize(attrs = {})
    self.email = attrs[:email]
    self.password = attrs[:password]
  end

  def login!
    @token ||= begin
      token = api.login!(password)
      @expiration = 90.days.from_now
      token
    end

    @token.present?
  end

  def vehicle_names
    api.vehicles.map(&:display_name).to_sentence
  rescue NoMethodError # API client throws error when `vehicles` is nil
    "(none)"
  end

protected

  def api
    @api ||= TeslaApi::Client.new(email, ENV["TESLA_CLIENT_ID"], ENV["TESLA_CLIENT_SECRET"])
  end
end
