require 'json'
require 'rest-client'
require_relative 'post'

class RemoteSource

	def self.add_posts(subreddit, posts) #This method passes in the request from the user and makes the request
  	RemoteSource.get(subreddit, posts).each do |post|
   	 Posts.add_post post #adds story to an array of stories.
  	end
	end

  def self.get(subreddit, posts)
  	response = RestClient.get("http://www.reddit.com/r/#{subreddit}/search.json?q=&restrict_sr=on&sort=top&t=all&limit=#{posts}")

    if response.include? '{"kind": "Listing", "data":'
	    hash_data = JSON.load(response)

	    hash_data["data"]["children"].map do |story|
	    	Post.new story["data"]["title"].downcase, story["data"]["score"].to_i
			end
		else
			puts ""
			puts "ERROR: Invalid subreddit or service is currently unavailable."
			puts "ERROR: Please try again..."
			puts ""
			# Process.exit!

			hash_data = ["a", "b", "c", "d"]
			hash_data.map do |story|
				Post.new "INVALID SUBREDDIT", 0
			end
		end
  end

end
