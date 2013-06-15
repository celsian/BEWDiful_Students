#GA BEWD Midterm
#Lucas Paolella

require_relative "lib/remote_source"
require_relative "lib/post"

again = "y"

while again == "y"
	puts "Welcome to the Reddit Popularity Checker"
	puts "Telling you where to go when you want to get seen..."
	puts "----------------------------------------------------"
	print "What subreddit are you interested in? "
	subreddit = gets.chomp.downcase
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

