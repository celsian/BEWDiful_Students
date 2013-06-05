# Add to Teddit!
# We want to be able to add stories from the command line

# Deliver this experience:
# 	Welcome the user to Teddit.
# 	Prompt for a story title.
# 	Wait for the users input (bonus: Don't use gets.chomp)
# 	Ask the user to give the story a category. 
# 	Wait for a response. 
# 	Show the new story the user added.
# 	Look for repetition and add methods to keep code DRY. 

# Heres an example of what you should see in the terminal when you finish coding.

#MY CODE

#---------START-----------
def ask_question(question)
	print question + " "

	gets.chomp
end

def upvote_it?
	print "Would you like to upvote this story? (y/n) "
	upvote = gets
	
	if upvote.chomp == 'y' || upvote.chomp == 'Y'
		return 1
	end

	return 0
end

def cats?(title, upvote_count)
	if title.downcase.include?("cat")
		return upvote_count*5
	elsif title.downcase.include?("bacon")
		return upvote_count*8
	elsif title.downcase.include?("food")
		return upvote_count*3
	else
		return upvote_count
	end
end


puts "Welcome to Teddit! A text based news aggregator. Get today's news tomorrow!"
story = ask_question("Please enter a News story:")

upvotes = 1
upvotes = cats?(story, upvotes)

category = ask_question("Please give it a category:")

puts "New story added! #{story}, Category: #{category}, Current Upvotes: #{upvotes}"

upvotes += upvote_it?

puts "Story: #{story}, Category: #{category}, Current Upvotes: #{upvotes}"
#-----------END----------

# def my_name
# 	print 'Lucas'
# end

# def age_check(age)
# 	my_name
# 	print ", you are #{age}, "
# 	if age >= 21
# 		print "here's a cold one."
# 	else
# 		print "here's a juice box."
# 	end
# 	return 0
# end

# def age_check_better(age)
# 	age >= 21
# end


# age_check(22)
# puts ""
# age_check(18)

# puts ""
# puts age_check_better(22)
# puts age_check_better(18)


#--- HOMEWORK START ----
input = 0
secretnumber = 14

while input != 14
	print "Guess a number: "
	input = gets.chomp.to_i

	if input > 14
		puts "Too big!"
	elsif input < 14
		puts "Too small!"
	elsif input == 14
		puts "You figured it out!"
	end
end
