require 'spec_helper'

describe Person do
  it "formatted_phone_number returns with the international code" do
    person = Person.new(phone_number: "7604434330")
    expect(person.formatted_phone_number).to eq("+17604434330")
  end
end