class Post

	def initialize(title, upvotes)
		@title = title
		@upvotes = upvotes
	end

	def to_s
		"Title: #{@title} | Upvotes: #{@channel}" 
	end

	def get_upvotes
		@upvotes
	end

	def get_title
		@title
	end
end

class Posts
	@@posts = []

	def self.add_post post
		@@posts << post
	end

	def self.posts
		@@posts
	end

	def self.clear
		@@posts = []
	end

	def self.upvote_avg
		avg_upvotes = 0
		@@posts.map do |post|
			avg_upvotes += post.get_upvotes
		end
		avg_upvotes
	end

	def self.word_avg
		final_word_list = []
		words = []	#makes the word array
		word_hash = {}	#Makes the word hash

		@@posts.map do |post| #Goes through every posts title, adds each word from the title to the words array
			words += post.get_title.split(/\W+/)
		end

		#Created a word blacklist to avoid lame 'top' words like the and to.
		word_blacklist = ["was", "more", "your","here","irst","like","think", "about", "our", "had", "when", "has", "all", "how", "why", "ever", "not", "this", "with", "from", "that", "been", "just", "some", "what", "have", "time", "made", "most", "they", "the", "for", "and", "you",
			"come", "get", "give", "go", "keep", "let", "make", "put", "seem", "take", "be", "do", "have", "say", "see", "send", "may", "will", "about", "
			across", "after", "against", "among", "at", "before", "between", "by", "down", "from", "in", "off", "on", "over", "through", "to", "
			under", "up", "with", "as", "for", "of", "till", "than", "a", "the", "all", "any", "every", "no", "other", "some", "such", "that", "
			this", "i", "he", "you", "who", "and", "because", "but", "or", "if", "though", "while", "how", "when", "where", "why", "again", "
			ever", "far", "forward", "here", "near", "now", "out", "still", "then", "there", "together", "well", "almost", "enough", "even", "
			little", "much", "not", "only", "quite", "so", "very", "tomorrow", "yesterday", "north", "south", "east", "west","please","yes",
			"first", "last", "are", "should", "would", "thing", "know", "their", "can", "done", "everyone", "don"]

		words.map do |word|
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
			final_word_list << "#{word_hash.key(word_value_array[pos])} #{word_value_array[pos]}".capitalize #Calls the key associated with the current word count and pushes that word into the final word array with the count after it capitalizes it
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