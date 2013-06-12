require_relative 'story'

class StoryBoard
	@@story = []

	def self.add_story story
		@@story << story
	
	end

	def self.stories
		@@story
	end
end
