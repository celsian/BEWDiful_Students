class PeanutsController < ApplicationController
  def index
    peanut = Peanut.new(flavor_value: '1', calories: nil)

    peanut.save!
    # binding.pry

    render text: "Hellllllllllllo"
  end
end