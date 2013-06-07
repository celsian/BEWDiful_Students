# Copy your solution from hashes_exercise.rb
# We're going to use a remote data source to pull in stories, apply categories
# and have them upvoted based on our rules. No more user input!
# Here are the URLs you will need: Choose one.
	# http://mashable.com/stories.json
	# http://digg.com/api/news/popular.json
	# http://www.reddit.com/.json

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"
# Figure out how to get to the data you need in the source you choose

require "rest-client"
require "json"
require "cgi"

url = "http://www.reddit.com/.json"

response = RestClient.get(url)

# directions = JSON.load(response) #All keys in JSON will be strings.
# route = directions["routes"][0]
# leg = route["legs"][0]

answer = JSON.load(response) #All keys in JSON will be strings.
data = answer["data"]
children = data["children"]

my_stories = []

children.each do |story|
	my_stories << { title: story["data"]["title"], category: story["data"]["subreddit"], upvotes: story["data"]["score"] }
end

def display_story(story)
	puts "Title: #{story[:title]} | Category: #{story[:category]} | Upvotes: #{story[:upvotes]}"
end

def calc_upvotes(category, upvotes)
	if category == "gaming"
		upvotes*1
	end
end

my_stories.each do |s|
	s[:upvotes] = calc_upvotes(s[:category], s[:upvotes])
	display_story(s)
end



#DO NOT DO IT LIKE BELOW!#DO NOT DO IT LIKE BELOW!#DO NOT DO IT LIKE BELOW!#DO NOT DO IT LIKE BELOW!#DO NOT DO IT LIKE BELOW!

# data2 = []
# title = []
# category = []
# upvotes = []

# 0.upto(children.length-1) do |num|
# 	data2[num] = children[num]["data"]
# 	title[num] = data2[num]["title"]
# 	category[num] = data2[num]["subreddit"]
# 	upvotes[num] = data2[num]["score"]
# 	puts "Title: #{title[num]} | Category: #{category[num]} | Upvotes: #{upvotes[num]}"
# end