# Write a program that prints 99 bottles of beer on the wall.
# The song starts with 
# 99 bottles of beer on the wall
# 99 bottles of beer!
# You take one down and pass it around,
# 98 bottles of beer on the wall!
#
# And ends with 
# 1 bottle of beer on the wall
# 1 bottle of beer!
# You take one down and pass it around,
# No more bottles of beer on the wall :-(

def bottles?(bot)
	if bot == 1
		"bottle"
	else
		"bottles"
	end
end

99.downto(1) do |bot|
	puts "#{bot} #{bottles?(bot)} of beer on the wall"
	puts "#{bot} #{bottles?(bot)} of beer!"
	puts "You take one down and pass it around,"
	if bot > 1
		puts "#{bot-1} #{bottles?(bot-1)} of beer on the wall!"
	else
		puts "No more bottles of beer on the wall :-("
	end
	puts ""
end