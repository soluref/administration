require "../spec_helper"

describe "routes for Widgets" do
  it "routes /widgets to the widgets controller" do
    { :get => "/" }.should route_to(:controller => "home", :action => "index")
  end
end