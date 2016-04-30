class LocationsController < ApplicationController

  def create
    @location = Location.find_or_create_by(location_params)
    session[:location_id] = @location.id
    nearby ||= Location.near(@location.coords, 5)
    @posts ||= Post.joins(:location).select(:guid, :subject, :content).merge(nearby)
  end

private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end

end