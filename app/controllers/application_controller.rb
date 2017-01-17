class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Hospital Locator Demo') do |username, password|
      md5_of_password = Digest::MD5.hexdigest(password)
      username == 'agilesix' && md5_of_password == '27c419d047f4a6720babe97b9775d4d0'
    end
  end
end
