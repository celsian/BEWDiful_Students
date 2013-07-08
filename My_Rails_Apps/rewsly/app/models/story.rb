class Story < ActiveRecord::Base
  validates :title, :link, :category, :presence => { :message => " is required." }
  validates_numericality_of :upvotes
  
  def self.search query
    where("title LIKE :query OR category LIKE :query", query: "%#{query}%")
  end
end
