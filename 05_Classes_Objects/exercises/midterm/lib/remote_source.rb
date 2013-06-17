require 'json'
require 'rest-client'
require_relative 'post'

class RemoteSource

	def self.add_posts(subreddit, posts) #This method passes in the request from the user and makes the request

		check_Validity(subreddit, posts) #Verifies the posts are valid before pulling them. Otherwise sets the @@response has to empty so it will fail the following test
  	
  	RemoteSource.get.each do |post| #Adds each Post object returned from .get to the Posts class array
   	 	Posts.add_post post #adds story to an array of stories.
  	end
	end

	def self.check_Validity(subreddit, posts) #Method for checking validity (and catching RestClient errors)
  	@@response = RestClient.get("http://www.reddit.com/r/#{subreddit}/search.json?q=&restrict_sr=on&sort=top&t=all&limit=#{posts}")
  	return true
	rescue RestClient::Unauthorized, RestClient::Forbidden, RestClient::BadRequest, RestClient::ResourceNotFound  
		@@response = {}
  	return false  
	end 

  def self.get #Gets each each of the top X post titles and upvotes and returns them.

    if @@response.include? '{"kind": "Listing", "data":' #If the data is valid it will return the top X post titles and upvotes...
	    hash_data = JSON.load(@@response)

	    hash_data["data"]["children"].map do |story| #Creates a new Post object for each story in the array from the hash and returns them
	    	Post.new story["data"]["title"].downcase, story["data"]["score"].to_i
			end
		else #... otherwise it will return 4 fake stores and output the following error. (The fake stories are necessary for other checks)
			puts ""
			puts "ERROR: Invalid subreddit or service is currently unavailable."
			puts "ERROR: Please try again..."
			puts ""
			# Process.exit!

			hash_data = ["a", "b", "c", "d"]
			hash_data.map do |story| #This mapping returns some fake stories to fill the Posts class and provide valid data for a check in midterm.rb
				Post.new "INVALID SUBREDDIT", 0
			end
		end
  end

end
