
# cheater = true

# def shout
# 	cheater = false
# 	puts "#{cheater ? "Is a" : "Is not a"} Cheater."
# end

# shout

$global_variable = "NEVER USE IT"

class Car
	@@cars_created = 0
	WHEELS = 4 #Constant always starts with a CAPITAL letter

	def initialize
		@@cars_created += 1
		@gasoline = 0
	end

	def fill_er_up
		@gasoline = 30
	end

	def has_gasoline?
		@gasoline > 0
	end

	def total_cars_created
		@@cars_created
	end

	def total_wheels
		WHEELS
	end
end

f150 = Car.new
f150.fill_er_up
puts f150.has_gasoline?

42.times do
	Car.new
end

puts f150.total_cars_created

puts Car::WHEELS
puts f150.total_wheels