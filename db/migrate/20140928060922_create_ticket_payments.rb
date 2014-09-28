class CreateTicketPayments < ActiveRecord::Migration
  def change
    create_table :ticket_payments do |t|
      t.float :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
