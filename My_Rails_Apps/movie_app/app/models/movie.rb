class Movie < ActiveRecord::Base
  #Validations for Movie attributes.
  validates :title, :presence => { :message => " is required." }
  validates :description, length: { minimum: 10 }
  validates_numericality_of :year_released, greater_than: 0, message: "must be a valid year. (ex: 1999)"
  validates :rating, inclusion: {in: 1..5, :message => "must be between 1 & 5."}


  #Easy search query adapted from shirts_reivew app.
  def self.search query
    where("title LIKE :query OR description LIKE :query OR year_released LIKE :query OR rating LIKE :query", query: "%#{query}%")
  end
end