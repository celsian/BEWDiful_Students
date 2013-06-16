#GA BEWD Midterm
#Lucas Paolella

require_relative "lib/remote_source"
require_relative "lib/post"

again = "y"

	puts "Welcome to the Reddit Popularity Checker! This app"
	puts "finds the top 5 words and average upvotes in the"
	puts "top 100 posts in the subreddit of your choice."
	puts "----------------------------------------------------"

while again == "y"
	print "What subreddit are you interested in? (exit! to quit): "
	subreddit = gets.chomp.downcase

	if subreddit == "exit!"
		puts "Good bye!"
		Process.exit!
	else
		subreddit = subreddit.gsub(/[^0-9a-z]/i, '')
	end

	posts = 100

	RemoteSource.add_posts(subreddit, posts) #This line calls the remote source method

	avg_upvotes = Posts.upvote_avg #Gets average upvotes

	avg_words = Posts.word_avg #Gets top 5 most used words

	Posts.clear #Clears out the Posts class to start over for additional calls

	if avg_upvotes != 0
		print "The average number of upvotes for the top #{posts} posts in /r/#{subreddit} is: "
		puts avg_upvotes = avg_upvotes/posts
		print "The 5 most used words in this subreddit are: "
		puts avg_words * ", "
		puts ""
		print "Enter 'y' to search again: "
		again = gets.chomp.downcase
		puts ""
	end
end

