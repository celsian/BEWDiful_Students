class ShirtsController < ApplicationController
  def index
    @shirt = Shirt.new
    @shirts = Shirt.all
  end

  def search
    @shirt = Shirt.new
    @shirts = Shirt.search params[:shirt][:name]
  end

  #the page that the user enters the details.
  def new
    @shirt = Shirt.new
  end

  #The create action takes the user input, and actually creates the user object in the database.
  def create
    @shirt = Shirt.new shirt_params

    if @shirt.save
      redirect_to shirts_path
    else
      render :new
    end
  end

  def shirt_params
    params.require(:shirt).permit(:name, :description)
  end

end
