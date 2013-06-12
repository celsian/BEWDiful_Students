#Second code alone class 05

class Laptop
	# attr_accessor :brand, :screen_size, :power

	def initialize(brand, screen_size)
		@brand = brand
		@screen_size = screen_size
		@power = false
	end

	def on?
		@power
	end

	def screen_detail
		"The display size is #{@screen_size}. Is is #{on? ? "" : "not "}on."
	end
end


laptop = Laptop.new("Mac", "15in")

puts laptop.class
puts laptop.on?
laptop.power = true
puts laptop.screen_detail