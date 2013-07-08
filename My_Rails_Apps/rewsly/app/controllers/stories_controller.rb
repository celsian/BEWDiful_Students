class StoriesController < ApplicationController
  def index
    @story = Story.new
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new story_params
    if @story.save #Another check for validation and redirect to movies_path, otherwise re-renders edit with errors.
      redirect_to stories_path
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
    @url = @story.link
  end

  def search
    @story = Story.new
    @stories = Story.search params[:story][:title]
    @search = params[:story][:title]
  end

  def story_params #Prevents users from passing in additional values into the new movie object
    params.require(:story).permit(:title, :upvotes, :category, :link)
  end

end
