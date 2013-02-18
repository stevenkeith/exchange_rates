require 'nokogiri'
require 'open-uri'
require "../../config/environment"

def get_todays_date
  time = Time.new
  time.strftime("%Y-%m-%d")  
end

def get_currency_list
  doc = Nokogiri::HTML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
  
  result = []
  # TODO: find out what time of day the exchange rates are updated on the ECB website.
  # search = "//cube[@time='#{get_todays_date}']/cube"
  search = "//cube[@time='2013-02-15']/cube"
  doc.xpath(search).each do |cube|
    result << cube.attr("currency")
  end
  
  return result
end

def get_sell_euro
  doc = Nokogiri::HTML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
  
  eur = {}
  # TODO: find out what time of day the exchange rates are updated on the ECB website.
  # search = "//cube[@time='#{get_todays_date}']/cube"
  search = "//cube[@time='2013-02-15']/cube"
  doc.xpath(search).each do |cube|
    eur[cube.attr("currency")] = cube.attr("rate").to_f
  end
  
  return eur
end

def get_sell_rate(what_are_we_selling, currencies, sell_euro, buy_euro)
  result = {}
  currencies.each do |currency|
    # currency -> EUR -> what are we selling
    # USD -> EUR -> GBP
    euros = sell_euro[currency]
    result[currency] = buy_euro[what_are_we_selling] * euros 
  end
  
  return result
end

def get_buy_rate(list)
  result = {}
  
  list.each do |key, value|
    result[key] = 1/value
  end
  
  return result
end

def create_buy_and_sell_dictionarys
  sells = {}
  buys = {}
  
  sells["EUR"] = get_sell_euro 
  buys["EUR"] = get_buy_rate sells["EUR"]

  currencies = get_currency_list
  currencies.each do |currency|
    sells[currency] = get_sell_rate currency, currencies, sells["EUR"], buys["EUR"]
    buys[currency] = get_buy_rate sells[currency]
  end
  
  return buys, sells
end

def add_to_database(buys, sells)
  buys.each do |target_currency, buy_rates|
    buy_rates.each do |source_currency, rate|
      ExchangeRate.where(:when => Date.parse('2013-02-15'),
                         :source_currency => source_currency, 
                         :destination_currency => target_currency,
                         :rate => rate).first_or_create
    end
  end
  
  sells.each do |source_currency, sell_rates|
    sell_rates.each do |target_currency, rate|
      ExchangeRate.where(:when => Date.parse('2013-02-15'),
                         :source_currency => source_currency, 
                         :destination_currency => target_currency,
                         :rate => rate).first_or_create
    end
  end
end

if __FILE__ == $0
  buys, sells = create_buy_and_sell_dictionarys
  add_to_database(buys, sells)
end