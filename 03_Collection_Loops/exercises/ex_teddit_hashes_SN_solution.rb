# Step 1: Working with Arrays and Hashes

# Create an empty stories array. This will be used to hold all stories we capture.
# Ask the user for a title, category, and current upvotes
# Once you have each of those inputs from your user, story them in a hash
# Your story hash should look like the one below:
# { title: "Monkeys thank mayor for flounder tooth necklace", category: "Teeth", upvotes: 1 }
# Add the hash to the array called stories
# Output the details of the story in a nice way, IE: "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
#
# Step 2: Adding Loops
# Use a loop, so that your program continues to ask a user for stories until they chose to quit. ("Would you like to add another story? Enter 'y' or 'n'")
# Once the user is finished with entering their stories, use .each to print each story in the stories array.
#
# Bonus: Add the same type of logic for changing the upvotes based on a type of category.

stories = []

def ask_question(question)
  puts question
  gets.chomp # Our users answer
end

loop do
  title = ask_question("What is the title?")
  category = ask_question("What is the category?")
  upvotes = ask_question("How many upvotes does it currently have").to_i

  story = {title: title, category: category, upvotes: upvotes}

  stories << story

  if ask_question("Would you like to add another story? Enter 'y' or 'n'") == "n"
    break
  end
end

stories.each do |story|
  puts story
end