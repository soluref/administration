require '../spec_helper'

describe SessionsController do


  render_views

  context "GET index" do
    before(:each) do
      get :sessions
    end
    it {should respond_with :success }
    it {should render_template(:index) }

    it "devrait avoir le bon titre" do
		response.should have_selector("titre", :content => "S'identifier")
    end
	it "devait avoir un message flash.now" do
		post :create, :session => @attr
		flash.now[:error].should =~ /invalid/i
	end	

  end
end