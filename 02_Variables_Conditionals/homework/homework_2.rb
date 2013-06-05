#My first homework assignment is located at: http://celsian.tumblr.com/

#--- HOMEWORK START ----
def guessMethod		#This method gets the user input and verifies it falls within acceptable limits.
	print "Enter your guess: "
	guess = gets.chomp.to_i #Takes the guess, chomps it, and type casts it to a Fixnum
	
	if guess >= 1 && guess <= 10 #Verifies guess is within acceptable limits.
		guess #Returns it.
	else
		print "Invalid guess, please pick a number between 1 & 10. "
		guessMethod	#Method calls itself again if the input is not acceptable.
	end
end

def guesses?(i)
	if i == 1
		puts "guess left."
	else
		puts "guesses left."
	end
end


puts "Welcome to the Secret Number Game, created by Lucas."	#Welcomes the user
print "Enter your name: "	#Requests the users name
name = gets.chomp 	#Gets the name and chomps it
puts "Hi #{name}!"	#Tells the user Hello and prints the users name.
puts "You have three chances to guess a number between 1 and 10."	#Instructions for the game.

secret_number = rand(10)+1 #Calculates the secret number
i = 3 #Sets the guesses to three
guess = 0 #0 initializes the users guess

while(i>0 && guess != secret_number) #Loops until the user is out of guesses & user has not guessed the secret_number
	i -= 1 #Increments the number of guesses
	guess = guessMethod #Calls the guess method and sets "guess" to the users guessed value
	if guess > secret_number #If the guess is too high...
		print "Too high! You have #{i} "
		guesses?(i)
	elsif guess < secret_number #If the guess is too low...
		print "Too low! You have #{i} "
		guesses?(i)
	elsif guess == secret_number #If they guessed correctly...
		puts "Congratulations #{name}, you guessed the Secret Number! You win!"
	end
end

if guess != secret_number #If case for failure to guess secret_number
	puts "Sorry #{name}, you've run out of guesses, you lose. The number was #{secret_number}."
end
#--- HOMEWORK END ----

