class MoviesController < ApplicationController
  def index #index action for controller, @movie is defined for the possible search from the front page.
    @movie = Movie.new
  end

  def search #Displays search results and also allows user to search again.
    @movie = Movie.new
    @movies = Movie.search params[:movie][:title]
    @search = params[:movie][:title]
  end

  def new #Action for creating a new movie from the form.
    @movie = Movie.new
  end

  def create #Creates the actual movie and saves it to the database if it meets the validations.
    @movie = Movie.new movie_params

    if @movie.save #If it can save, redirects to movie path, otherwise renders new page again (and errors are displayed)
      redirect_to movies_path
    else
      render :new
    end
  end

  def movie_params #Prevents users from passing in additional values into the new movie object
    params.require(:movie).permit(:title, :description, :year_released, :rating)
  end

  def show #The action for showing a particular movie.
    @movie = Movie.find(params[:id])
  end

  def edit #The action for editing a particular movie.
    @movie = Movie.find(params[:id])
  end

  def update #The actual code for updating the edited movie.
    @movie = Movie.update(params[:id], movie_params)
    if @movie.save #Another check for validation and redirect to movies_path, otherwise re-renders edit with errors.
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_all_path
  end

  def all #Action for showing the entire database.
    @movie = Movie.new
    @movies = Movie.all
  end

end