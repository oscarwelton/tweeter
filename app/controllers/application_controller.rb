class ApplicationController < ActionController::Base
  before_action :set_content_security_policy

  private

  def set_content_security_policy
    response.headers["Content-Security-Policy"] = "default-src 'self'; script-src 'self' 'unsafe-inline' blob:; style-src 'self' 'unsafe-inline' fonts.googleapis.com; img-src 'self' i.ibb.co; frame-ancestors 'self' *;"
  end
end
