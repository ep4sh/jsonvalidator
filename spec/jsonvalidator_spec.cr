require "./spec_helper"

describe "JSONValidator" do
  it "renders /v" do
    get "/v"
    response.body.should eq "0.1.0"
  end
end
