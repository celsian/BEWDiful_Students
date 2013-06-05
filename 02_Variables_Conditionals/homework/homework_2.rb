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

def guesses?(i) #Method appends the proper grammar to the end of "guess(es)"
	if i == 1 #if the guesses left is one, do this
		"guess"
	else #if the guesses left is anything else, do this.
		"guesses"
	end
end

#--- Output Start ---
puts "Welcome to the Secret Number Game, created by Lucas."	#Welcomes the user
print "Enter your name: "	#Requests the users name
name = gets.chomp 	#Gets the name and chomps it
puts "Hi #{name}!"	#Tells the user Hello and prints the users name.
puts "You have three chances to guess a number between 1 and 10."	#Instructions for the game.

secret_number = rand(10)+1 #Calculates the secret number
guess = 0 #0 Intiialize the guess

2.downto(0) do |num| #Loop 3 times (for 3 guesss)
	guess = guessMethod #Ask for the guess
	if guess > secret_number #If the guess is too high...
		puts "Too high! You have #{num} #{guesses?(num)} left."
	elsif guess < secret_number #If the guess is too low...
		puts "Too low! You have #{num} #{guesses?(num)} left."
	elsif guess == secret_number #If they guessed correctly...
		puts "Congratulations #{name}, you guessed the Secret Number! You win!"
		break
	end
end

if guess != secret_number #If case for failure to guess secret_number
	puts "Sorry #{name}, you've run out of guesses, you lose. The number was #{secret_number}."
end
#--- Output End ---
#--- HOMEWORK END ----

