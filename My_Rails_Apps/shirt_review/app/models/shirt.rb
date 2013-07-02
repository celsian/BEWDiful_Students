class Shirt < ActiveRecord::Base
  SYM_RENAME = {name: "Shirt name", description: "Shirt description"}
  
  def self.human_attribute_name(attr)
    SYM_RENAME[attr.to_sym]
  end

  validates :name, :description, :presence => { :message => " is required." }

  def self.search(query)
    #Same as below --> Shirt.where("name LIKE :query", query: "%#{query}%")
    where("name LIKE :query OR description LIKE :query", query: "%#{query}%") #has to be like this to avoid injection attacks.
    #where("name LIKE ?", "%#{query}%") #works too.
  end

end
