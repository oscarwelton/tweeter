class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_content_security_policy

  private

  def set_content_security_policy
    response.headers["Content-Security-Policy"] = "default-src 'self'; script-src 'self' 'unsafe-inline' blob:; style-src 'self' 'unsafe-inline' fonts.googleapis.com; img-src 'self' i.ibb.co; font-src 'self' fonts.gstatic.com; frame-ancestors 'self' *;"
  end
end
