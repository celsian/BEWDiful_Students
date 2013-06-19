#The ui class for user input and program output

require_relative 'remote_source'
require_relative 'post'
require_relative 'posts'

class Ui
	def self.main
			puts "Welcome to the Reddit Popularity Checker! This app"
			puts "finds the top 5 words and average upvotes in the"
			puts "top 100 posts in the subreddit of your choice."
			puts "----------------------------------------------------"

		while true
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

			avg_upvotes = Posts.upvote_avg(posts) #Gets average upvotes

			avg_words = Posts.word_avg #Gets top 5 most used words

			Posts.clear #Clears out the Posts class to start over for additional calls

			if avg_upvotes != 0 #The average # of upvotes will always be != 0 unless the requested subreddit is invalid.
				print "The average number of upvotes for the top #{posts} posts in /r/#{subreddit} is: "
				puts avg_upvotes
				print "The 5 most used words in this subreddit are: "
				puts avg_words * ", "
				puts ""
				#Following code is pointless because they can escape the program from the search line.
				# print "Enter 'y' to search again: "
				# again = gets.chomp.downcase
				# puts ""
			end
		end
	end
end