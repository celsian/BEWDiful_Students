require "rest-client"
require "json"

url = "http://mashable.com/stories.json"

response = RestClient.get(url)
parsed_response = JSON.load(response)

new_stories = parsed_response["new"]

my_stories = []
new_stories.each do |story|
  my_stories << { title: story["title"], category: story["channel"], upvotes: story["shares"]["total"] }
end

def calculate_upvotes(category, upvotes)
  if category == "Tech"
    upvotes * 33
  else
    upvotes
  end
end

def display_story(story)
  actual_upvotes = calculate_upvotes(story[:category], story[:upvotes])
  puts "Title: #{story[:title]} | Category: #{story[:category]} " +
       "| Upvotes: #{actual_upvotes}"
end

my_stories.each do |s|
  display_story(s)
end