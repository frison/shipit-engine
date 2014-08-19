module Shipit::Config
  def github_api
    credentials = Rails.application.secrets.github_credentials || {}
    @github_api ||= Octokit::Client.new(credentials.symbolize_keys)
  end

  delegate :authentication, :github, :host, to: :secrets

  def github_key
    github && github['key']
  end

  def github_secret
    github && github['secret']
  end

  def extra_env
    secrets.env || {}
  end

  protected

  def secrets
    Rails.application.secrets
  end

end
