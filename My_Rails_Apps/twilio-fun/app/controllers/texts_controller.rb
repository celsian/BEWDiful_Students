class TextsController < ApplicationController
  def index
  end

  def new
  end

  def create
    binding.pry
    Person.send_mass_message(params[:text][:message])
    redirect_to texts_path, flash: {notice: "Sent text messages to #{Person.count} #{"person".pluralize(Person.count)}."}
  end
end
