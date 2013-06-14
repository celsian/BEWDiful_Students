#This file adds on additional info from class 5
class Employee
	attr_accessor :first_name, :last_name

	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name = last_name
	end

	def full_name
		"#{first_name} #{last_name}"
	end

end

class Manager < Employee
	attr_accessor :title

	def initialize(first_name, last_name, title)
		@title = title
		
		super(first_name, last_name)
	end

	def full_name_with_title
		"#{full_name} (#{title})"
	end
end

puts Manager.new("Robert", "Ross", "Chickens").full_name_with_title
puts Manager.new("Robert", "Ross", "Chickens").full_name