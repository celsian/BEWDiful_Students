class Story
	def initialize(title, channel)
		@title = title
		@channel = channel
	end

	def to_s
		"Title: #{@title} | Channel: #{@channel}" 
	end
end
