class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.date :when
      t.string :source_currency
      t.string :destination_currency
      t.decimal :rate

      t.timestamps
    end
  end
end
