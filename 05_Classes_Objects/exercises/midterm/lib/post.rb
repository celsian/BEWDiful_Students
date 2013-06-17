#Classes Post and Posts
#Post creates a post object with the title and upvotes of the reddit post.
#Posts keeps an array of post objects and performs functions on the class array

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

class Posts #Class that stores the post objects in a class array
	@@posts = []

	def self.add_post post #add 'post' to the class array '@@posts'
		@@posts << post
	end

	def self.posts #Returns the class array '@@posts'
		@@posts
	end

	def self.clear #Clears the class array for additional requests
		@@posts = []
	end

	def self.upvote_avg posts #Calcs the average upvotes for top 'posts' posts
		avg_upvotes = 0
		@@posts.each do |post| #For each post object in posts add the upvotes together.
			avg_upvotes += post.get_upvotes
		end
		avg_upvotes/posts #Divide total avg_upvotes by 'posts' and return.
	end

	def self.word_avg
		final_word_list = []
		words = []	#makes the word array
		word_hash = {}	#Makes the word hash

		@@posts.each do |post| #Goes through every posts title, adds each word from the title to the words array
			words += post.get_title.split(/\W+/)
		end

		#Created a word blacklist to avoid lame 'top' words like the and to.
		word_blacklist = ["was", "more", "your","here","irst","like","think", "about", "our", "had", "when", "has", "all", "how", "why", "ever", "not", "this", "with", "from", "that", "been", "just", "some", "what", "have", "time", "made", "most", "they", "the", "for", "and", "you",
			"come", "get", "give", "go", "keep", "let", "make", "put", "seem", "take", "be", "do", "have", "say", "see", "send", "may", "will", "about", "
			across", "after", "against", "among", "before", "between", "down", "from", "off", "over", "through", "
			under", "up", "with", "as", "for", "till", "than", "a", "the", "all", "any", "every", "no", "other", "some", "such", "that", "
			this", "you", "who", "and", "because", "but", "though", "while", "how", "when", "where", "why", "again", "
			ever", "far", "forward", "here", "near", "now", "out", "still", "then", "there", "together", "well", "almost", "enough", "even", "
			little", "much", "not", "only", "quite", "so", "very", "please","yes",
			"first", "last", "are", "should", "would", "thing", "know", "their", "can", "done", "everyone", "don"]

		words.each do |word|
			if !word_blacklist.include?(word) && word.length > 2
				if word_hash.has_key?(word)
					word_hash[word] += 1 #Find word already on word_hash and add 1 to the count
				else
					word_hash[word] = 1 #Add word to the word_hash and set value to 1
				end
			end
		end

		word_value_array = word_hash.values.sort #Sorts the word counts from least to most

		(word_value_array.length-1).downto(word_value_array.length-5) do |pos| #Goes through the top word values
			final_word_list << "#{word_hash.key(word_value_array[pos])} (#{word_value_array[pos]})".capitalize #Calls the key associated with the current word count and pushes that word into the final word array with the count after it capitalizes it
			word_hash[word_hash.key(word_value_array[pos])] = 0 #Clears the key value in case of multiple keys with the same value.
		end

			final_word_list
	end #Ends self.upvote_avg

end #Ends the class.

	# def add_post post
	# 	posts << post
	# end

	# def posts
	# 	@posts ||= []
	# end