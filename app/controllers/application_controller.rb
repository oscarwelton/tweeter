class ApplicationController < ActionController::Base
  before_action :set_content_security_policy

  private

  def set_content_security_policy
    response.headers["Content-Security-Policy"] = "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self'; frame-ancestors 'self' *;"
  end
end
