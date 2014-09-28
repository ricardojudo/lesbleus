class Api::V1::UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!
  
  def index
    render json: current_user, status: :ok
  end
  
  def update
    
    
    
  end

end
