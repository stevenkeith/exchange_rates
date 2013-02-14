class HomeController < ApplicationController
  def index
    if request.post?
      @when = params[:when]
      @amount = params[:amount]
      @source_currency = params[:source_currency]
      @destination_currency = params[:destination_currency]
      
      @rate = ExchangeRate.where(:when => @when,
                                 :destination_currency => @destination_currency,
                                 :source_currency => @source_currency).first.rate
                         
      @result = "#{@amount} #{@source_currency} => #{@rate*@amount.to_f} #{@destination_currency}"  
    end
    
    @source_currencies = ExchangeRate.uniq.pluck(:source_currency)
    @destination_currencies = ExchangeRate.uniq.pluck(:destination_currency)
  end
end
