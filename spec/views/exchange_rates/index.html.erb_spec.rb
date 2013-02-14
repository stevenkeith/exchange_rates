require 'spec_helper'

describe "exchange_rates/index" do
  before(:each) do
    assign(:exchange_rates, [
      stub_model(ExchangeRate,
        :source_currency => "Source Currency",
        :destination_currency => "Destination Currency",
        :rate => "9.99"
      ),
      stub_model(ExchangeRate,
        :source_currency => "Source Currency",
        :destination_currency => "Destination Currency",
        :rate => "9.99"
      )
    ])
  end

  it "renders a list of exchange_rates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source Currency".to_s, :count => 2
    assert_select "tr>td", :text => "Destination Currency".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
