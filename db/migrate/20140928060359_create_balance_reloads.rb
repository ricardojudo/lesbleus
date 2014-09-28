class CreateBalanceReloads < ActiveRecord::Migration
  def change
    create_table :balance_reloads do |t|
      t.float :amount
      t.string :pay_pal_tx
      t.integer :user_id

      t.timestamps
    end
  end
end
