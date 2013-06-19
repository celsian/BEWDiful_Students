#Class Post
#Post creates a post object with the title and upvotes of the reddit posts

class Post

	def initialize(title, upvotes) #initialize method for a post object
		@title = title
		@upvotes = upvotes.to_i
	end

	def to_s #method for testing purpose which allows me to write 'puts (post object)'
		"Title: #{@title} | Upvotes: #{@channel}" 
	end

	def get_upvotes #returns upvotes value
		@upvotes
	end

	def get_title #returns title string
		@title
	end
end