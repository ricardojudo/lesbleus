class Api::V1::BusesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def update_position
    bus=Bus.where(bid: bid=bus_params[:bid]).first
    if bus.update(bus_params)
      if bleus_action
        if bleus_action == 'Check-In'
          bus.increase_passengers
        elsif bleus_action == 'Check-Out'
          bus.decrease_passengers
        end
        bus.save
      end
    
      render json: bus, status: :ok
    else
      render json: episode.errors, status: 422
    end

    
  end


  def index
    delta=0.001
    stop=Stop.find(params[:stop_id])
    
    min_longitude=stop.longitude-delta
    max_longitude=stop.longitude+delta
    
    min_latitude=stop.latitude-delta
    max_latitude=stop.latitude+delta
    stop=Stop.find(params[:stop_id])
    buses=Bus.where(route: stop.route, latitude: (min_latitude .. max_latitude), longitude: (min_longitude .. max_longitude))    
    render json: buses, status: :ok
  end

  private
  def bus_params
    params.require(:bus).permit( :bid, :longitude, :latitude)
  end
  
  def bleus_action
    request.headers['Bleus-Action']
  end
  
end
