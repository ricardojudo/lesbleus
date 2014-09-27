class Api::V1::StopsController < ApplicationController

  def index
    dlongitude=0.0008
    dlatitude=0.0008
    
    min_longitude=params[:longitude].to_f-dlongitude
    max_longitude=params[:longitude].to_f+dlongitude
    
    min_latitude=params[:latitude].to_f-dlatitude
    max_latitude=params[:latitude].to_f+dlatitude
    
    stops=Stop.where(latitude: (min_latitude .. max_latitude), longitude: (min_longitude .. max_longitude))
    render json: stops, status: :ok
  end

end
