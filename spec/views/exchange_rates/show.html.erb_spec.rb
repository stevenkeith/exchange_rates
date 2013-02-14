require 'spec_helper'

describe "exchange_rates/show" do
  before(:each) do
    @exchange_rate = assign(:exchange_rate, stub_model(ExchangeRate,
      :source_currency => "Source Currency",
      :destination_currency => "Destination Currency",
      :rate => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source Currency/)
    rendered.should match(/Destination Currency/)
    rendered.should match(/9.99/)
  end
end
