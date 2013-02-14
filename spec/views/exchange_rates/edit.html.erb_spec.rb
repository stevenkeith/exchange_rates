require 'spec_helper'

describe "exchange_rates/edit" do
  before(:each) do
    @exchange_rate = assign(:exchange_rate, stub_model(ExchangeRate,
      :source_currency => "MyString",
      :destination_currency => "MyString",
      :rate => "9.99"
    ))
  end

  it "renders the edit exchange_rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exchange_rates_path(@exchange_rate), :method => "post" do
      assert_select "input#exchange_rate_source_currency", :name => "exchange_rate[source_currency]"
      assert_select "input#exchange_rate_destination_currency", :name => "exchange_rate[destination_currency]"
      assert_select "input#exchange_rate_rate", :name => "exchange_rate[rate]"
    end
  end
end
