class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol, index: {unique: true}

      t.decimal :price_in_usd, precision: 12, scale: 2

      t.timestamps
    end
  end
end
