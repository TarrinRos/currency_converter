class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.integer :from_currency_id, index: true
      t.integer :to_currency_id, index:true
      t.decimal :amount, precision: 18, scale: 8
      t.decimal :from_currency_price_in_usd, precision: 12, scale: 2
      t.decimal :to_currency_price_in_usd, precision: 12, scale: 2

      t.timestamps
    end
  end
end
