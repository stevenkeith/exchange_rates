class ExchangeRate < ActiveRecord::Base
  attr_accessible :destination_currency, :rate, :source_currency, :when
  
  validates :destination_currency, :presence => true, :length => { :is => 3 }
  validates :rate,  :presence => true
  validates :source_currency,  :presence => true,  :length => { :is => 3 }
  validates :when,  :presence => true
end
