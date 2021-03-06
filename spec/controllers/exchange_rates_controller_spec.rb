require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ExchangeRatesController do

  # This should return the minimal set of attributes required to create a valid
  # ExchangeRate. As you add validations to ExchangeRate, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExchangeRatesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all exchange_rates as @exchange_rates" do
      exchange_rate = ExchangeRate.create! valid_attributes
      get :index, {}, valid_session
      assigns(:exchange_rates).should eq([exchange_rate])
    end
  end

  describe "GET show" do
    it "assigns the requested exchange_rate as @exchange_rate" do
      exchange_rate = ExchangeRate.create! valid_attributes
      get :show, {:id => exchange_rate.to_param}, valid_session
      assigns(:exchange_rate).should eq(exchange_rate)
    end
  end

  describe "GET new" do
    it "assigns a new exchange_rate as @exchange_rate" do
      get :new, {}, valid_session
      assigns(:exchange_rate).should be_a_new(ExchangeRate)
    end
  end

  describe "GET edit" do
    it "assigns the requested exchange_rate as @exchange_rate" do
      exchange_rate = ExchangeRate.create! valid_attributes
      get :edit, {:id => exchange_rate.to_param}, valid_session
      assigns(:exchange_rate).should eq(exchange_rate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ExchangeRate" do
        expect {
          post :create, {:exchange_rate => valid_attributes}, valid_session
        }.to change(ExchangeRate, :count).by(1)
      end

      it "assigns a newly created exchange_rate as @exchange_rate" do
        post :create, {:exchange_rate => valid_attributes}, valid_session
        assigns(:exchange_rate).should be_a(ExchangeRate)
        assigns(:exchange_rate).should be_persisted
      end

      it "redirects to the created exchange_rate" do
        post :create, {:exchange_rate => valid_attributes}, valid_session
        response.should redirect_to(ExchangeRate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved exchange_rate as @exchange_rate" do
        # Trigger the behavior that occurs when invalid params are submitted
        ExchangeRate.any_instance.stub(:save).and_return(false)
        post :create, {:exchange_rate => {}}, valid_session
        assigns(:exchange_rate).should be_a_new(ExchangeRate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ExchangeRate.any_instance.stub(:save).and_return(false)
        post :create, {:exchange_rate => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested exchange_rate" do
        exchange_rate = ExchangeRate.create! valid_attributes
        # Assuming there are no other exchange_rates in the database, this
        # specifies that the ExchangeRate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ExchangeRate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => exchange_rate.to_param, :exchange_rate => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested exchange_rate as @exchange_rate" do
        exchange_rate = ExchangeRate.create! valid_attributes
        put :update, {:id => exchange_rate.to_param, :exchange_rate => valid_attributes}, valid_session
        assigns(:exchange_rate).should eq(exchange_rate)
      end

      it "redirects to the exchange_rate" do
        exchange_rate = ExchangeRate.create! valid_attributes
        put :update, {:id => exchange_rate.to_param, :exchange_rate => valid_attributes}, valid_session
        response.should redirect_to(exchange_rate)
      end
    end

    describe "with invalid params" do
      it "assigns the exchange_rate as @exchange_rate" do
        exchange_rate = ExchangeRate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ExchangeRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => exchange_rate.to_param, :exchange_rate => {}}, valid_session
        assigns(:exchange_rate).should eq(exchange_rate)
      end

      it "re-renders the 'edit' template" do
        exchange_rate = ExchangeRate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ExchangeRate.any_instance.stub(:save).and_return(false)
        put :update, {:id => exchange_rate.to_param, :exchange_rate => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested exchange_rate" do
      exchange_rate = ExchangeRate.create! valid_attributes
      expect {
        delete :destroy, {:id => exchange_rate.to_param}, valid_session
      }.to change(ExchangeRate, :count).by(-1)
    end

    it "redirects to the exchange_rates list" do
      exchange_rate = ExchangeRate.create! valid_attributes
      delete :destroy, {:id => exchange_rate.to_param}, valid_session
      response.should redirect_to(exchange_rates_url)
    end
  end

end
