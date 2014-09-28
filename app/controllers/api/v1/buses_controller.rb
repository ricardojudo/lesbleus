class Api::V1::BusesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def update_position
    bus=Bus.where(bid: bid=bus_params[:bid]).first
    if bus.update(bus_params)
      render json: bus, status: :ok
    else
      render json: episode.errors, status: 422
    end
  end

  private
  def bus_params
    params.require(:bus).permit( :bid, :longitude, :latitude)
  end
  
  def bleus_action
    request.headers['Bleus-Action']
  end
end
