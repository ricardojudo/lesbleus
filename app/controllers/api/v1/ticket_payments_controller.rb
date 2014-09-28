class Api::V1::TicketPaymentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  #before_filter :authenticate_custom_user!#:authenticate_user!
  
  def create
    current_user=User.where(:id => params[:token]).first
    amount = ticket_payment_params[:amount].to_f
    if current_user.enough_balance(amount)
      current_user.pay_ticket(amount)
      current_user.save
      ticket_payment=TicketPayment.new(ticket_payment_params, :user_id => current_user.id)
      ticket_payment.save
      data={'flash_code'=>'11001'}
      status= :ok
    else
      data={'error_message'=>'Not enough balance'}
      status=422
    end
    render json: data, status: status
  end

  def ticket_payment_params
    params.require(:ticket_payment).permit(:amount)
  end
  
end
