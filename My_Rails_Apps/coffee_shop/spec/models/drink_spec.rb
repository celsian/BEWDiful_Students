require 'spec_helper'

describe Drink do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :description }

  describe "#formatted_price" do
    it 'returns with a dollar sign' do
      subject.price = 5.99
      expect(subject.formatted_price).to eq("$5.99")

      
    end

    it 'returns with padded zeros' do
      subject.price = 5
      expect(subject.formatted_price).to eq("$5.00")

      
    end
  end




  #Pending examples:
  # pending 'asdfgjkdfjs'

  # it "is delcicious" do
  #   pending
  # end
end
