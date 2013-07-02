class Book < ActiveRecord::Base
  validates :title, :description, :author, :presence => { :message => " is required." }
end
