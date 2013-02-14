class ExchangeRatesController < ApplicationController
  # GET /exchange_rates
  # GET /exchange_rates.json
  def index
    @exchange_rates = ExchangeRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exchange_rates }
    end
  end

  # GET /exchange_rates/1
  # GET /exchange_rates/1.json
  def show
    @exchange_rate = ExchangeRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exchange_rate }
    end
  end

  # GET /exchange_rates/new
  # GET /exchange_rates/new.json
  def new
    @exchange_rate = ExchangeRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exchange_rate }
    end
  end

  # GET /exchange_rates/1/edit
  def edit
    @exchange_rate = ExchangeRate.find(params[:id])
  end

  # POST /exchange_rates
  # POST /exchange_rates.json
  def create
    @exchange_rate = ExchangeRate.new(params[:exchange_rate])

    respond_to do |format|
      if @exchange_rate.save
        format.html { redirect_to @exchange_rate, notice: 'Exchange rate was successfully created.' }
        format.json { render json: @exchange_rate, status: :created, location: @exchange_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exchange_rates/1
  # PUT /exchange_rates/1.json
  def update
    @exchange_rate = ExchangeRate.find(params[:id])

    respond_to do |format|
      if @exchange_rate.update_attributes(params[:exchange_rate])
        format.html { redirect_to @exchange_rate, notice: 'Exchange rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exchange_rates/1
  # DELETE /exchange_rates/1.json
  def destroy
    @exchange_rate = ExchangeRate.find(params[:id])
    @exchange_rate.destroy

    respond_to do |format|
      format.html { redirect_to exchange_rates_url }
      format.json { head :no_content }
    end
  end
end
