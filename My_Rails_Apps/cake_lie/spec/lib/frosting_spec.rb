require 'spec_helper'

describe CakeLie::Frosting do
  # subject { CakeLie::Frosting.new }
  describe "#spatula" do
    it "returns the name of a cake" do
      # frosting = CakeLie::Frosting.new
      # frosting = described_class.new
      # subject is already defined from line 4 which is already given by rspec.

      expect(described_class::CAKES).to include subject.spatula

    end
  end

  describe "#cake_with_color" do
    it "returns the name of a cake with a color" do
      sentence = subject.cake_with_color
      matched = sentence.match /A (\w+) ([\w\s]+)/
      
      expect(described_class::COLORS).to include matched[1]
      expect(described_class::CAKES).to include matched[2]
    end
  end
end