class HomeController < ApplicationController
  def index
    if request.post?
      @when = params[:when]
      @source_currency = params[:source_currency]
      @destination_currency = params[:destination_currency]
      @rate = ExchangeRate.at(@when, @source_currency, @destination_currency)
      
      @amount = params[:amount]                   
      @result = "#{@amount} #{@source_currency} => #{@rate*@amount.to_f} #{@destination_currency}"  
    end
    
    @source_currencies = ExchangeRate.uniq.pluck(:source_currency)
    @destination_currencies = ExchangeRate.uniq.pluck(:destination_currency)
  end
end
