class Api::V1::StopsController < ApplicationController

  def index
    delta=0.005
    
    min_longitude=params[:longitude].to_f-delta
    max_longitude=params[:longitude].to_f+delta
    
    min_latitude=params[:latitude].to_f-delta
    max_latitude=params[:latitude].to_f+delta
    
    stops=Stop.where(latitude: (min_latitude .. max_latitude), longitude: (min_longitude .. max_longitude))
    render json: stops, status: :ok
  end

end
