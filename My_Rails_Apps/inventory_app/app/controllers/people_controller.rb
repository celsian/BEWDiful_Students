class PeopleController < ApplicationController
  def index
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
  end

  def edit
  end
end
