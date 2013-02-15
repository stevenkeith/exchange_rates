require 'nokogiri'
require 'open-uri'
require "../../config/environment"

def get_currency_list
  doc = Nokogiri::HTML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
  
  result = []
  doc.xpath("//cube[@time='2013-02-14']/cube").each do |cube|
    result << cube.attr("currency")
  end
  
  return result
  
end

def get_sell_euro
  doc = Nokogiri::HTML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
  
  eur = {}
  doc.xpath("//cube[@time='2013-02-14']/cube").each do |cube|
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

if __FILE__ == $0
 currencies = get_currency_list
 
 # bootstrap with euros
 sell_euro = get_sell_euro
 buy_euro = get_buy_rate sell_euro
 
 # fill in the blanks
 currencies.each do |currency|
   sell = get_sell_rate currency, currencies, sell_euro, buy_euro 
   buy = get_buy_rate sell
 end
 
 
end