require "spec_helper"

describe TextsController do
  
  describe "GET new" do
    it "responds ok" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "POST create" do
    it "sends multiple messages" do
      Person.should_receive(:send_mass_message).with("123 ABC")
      post :create, text: { message: "123 ABC" }
    end
  end

end