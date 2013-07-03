class ShirtsController < ApplicationController

  def index
    @shirts = Shirt.all
  end

  def new
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.new shirt_params

    if @shirt.save
      redirect_to shirts_path, flash: {success: "Shirt was created."}
    else
      render :new
    end
  end

  def edit
    @shirt = Shirt.find params[:id]
  end

  def update
    @shirt = Shirt.find params[:id]
    
    if @shirt.update_attributes(shirt_params)
      redirect_to shirts_path, flash: {success: "Shirt was updated."}
    else
      render :edit
    end
  end

  def show
    @shirt = Shirt.find params[:id]
  end

  def destroy
    Shirt.find(params[:id]).destroy
    
    redirect_to shirts_path, flash: {success: "Shirt was deleted."}
  end

  private
  def shirt_params
    params.require(:shirt).permit(:name, :description, :color)
  end
end
