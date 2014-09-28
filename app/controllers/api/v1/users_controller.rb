class Api::V1::UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  
  def index
    current_user=User.find(params[:token].to_i)
    render json: current_user, status: :ok
  end

end
