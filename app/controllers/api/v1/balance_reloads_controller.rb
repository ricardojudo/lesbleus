class Api::V1::BalanceReloadsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  #before_filter :authenticate_user!
  
  def create
    balance_reload=BalanceReload.new(balance_reload_params, :user_id => current_user.id)
    
    if balance_reload.save
      current_user=User.where(:id => params[:token]).first
      current_user.pay_balance(balance_reload_params[:amount].to_f)
      current_user.save
      
      render nothing: true, status: 204
    else
      render json: episode.errors, status: 422
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def balance_reload_params
    params.require(:balance_reload).permit(:amount, :pay_pal_tx)
  end

end
