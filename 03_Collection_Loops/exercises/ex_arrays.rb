# Create a variable called "categories" and assign it an empty array.
# Add 3 strings to the array you created, do it differently all 3 times.
# Make the array only contain unique objects (in this case, strings).
# Make a condition along the lines of "If categories has Animals and Shopping within it", if the condition is true, add "Family" to the array.
# Print all of the elements with a comma separating each of them, in alphabetical order.
# Print AND remove the first category.
# Print AND remove the last category.
# Write a conditional that checks if the array has more than 5 elements in it. If the condition is true, remove all elements.
# Hug yourself.

categories = []

categories << "Animals"
categories.push "Shopping"
categories.unshift "Charlie"

categories.uniq!

if categories.include?("Animals") && categories.include?("Shopping")
	categories << "Family"
end

puts categories.sort.join(", ") #THis is the proper way to do the following lines that are commented

# 0.upto(categories.size-1) do |num|
# 	print "#{categories.sort[num]}"
# 	if categories.size-1 != num
# 		print ", "
# 	end
# end
# puts ""

puts categories.shift
puts categories.pop

if categories.size > 5
	categories = []
end