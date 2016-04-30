class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_location

  # Configure additonal flash message types.
  add_flash_types :success, :error

  def current_location
    @current_location ||= Location.find_by(id: session[:location_id])
  end

private

  def session_id
    request.session_options[:id]
  end

end
