<img id="icon" src="https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png">

#BEWD - Collections, Loops & APIs

###Instructor Name

Instructors current role.

---


##Agenda

*	Recap
	*	Quick Fire
*	Practical Application Of Collections & Loops (APIs)
*	Lab Time

---


<img id ='icon' src="../../assets/ICL_icons/Exercise_icon_md.png">
##Quick Fire - Fizz Buzz

---


##Quick Fire
###Fizz Buzz

TIME : 30 min

*	Write a program that prints numbers from 1 to 100.
*	But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”.
*	For numbers which are multiples of both three and five print “FizzBuzz”.
* *cough* methods, *cough*

---



##Recap

*	Variables
*	Conditionals
*	Iteration
*	Collections


---


##Working With Collections
###Let's get practical


---


##APIs
###Application Programming Interface

"Generally speaking, an application programming interface (API) is a specification of how some software components should interact with each other."
	- https://en.wikipedia.org/wiki/Application_programming_interface


---


##APIs
###Working with network based APIs

1. Ask for some data
2. Convert it into a format we can work with
3. Do cool stuff

---

##Gems
###What are they?

* A Gem is another Ruby library that someone has made publically available.
* Gems are installed in terminal by typing in `gem install GEMNAME` in your terminal where GEMNAME is the Gem you'd like to install

---

##APIs
###Asking for Data


*	Using Gems allows you to cut back on development time a lot of the time.
* In this class we're going to use a gem to ask an API for data.

		$ gem install rest-client

---


##API
###Convert into a format we can work with


*	JSON - JavaScript Object Notation

		{"NY":"New York","LA":"Los Angeles","SYD":"Sydney","LDN":"London"}


---


##Do Cool Stuff
<img id ='icon' src="../../assets/ICL_icons/Code_along_icon_md.png">

Getting Tweets


---



<img id ='icon' src="../../assets/ICL_icons/Exercise_icon_md.png">
##Teddit API News

---


## Homework

*	Continue review
*	Add another blog entry

---


<div id="resources">
## Resources: Collections, Loops & APIs

###Cheat Sheet

####Array of Hashes

```ruby
	super_heros =[{ hero: 'Batman', secret_identity: 'Bruce Wayne'},
	{hero: 'Superman', secret_identity: 'Clark Kent'},
	{hero: 'Spiderman', secret_identity: 'Peter Parker'}]
```


####.each & .map

```ruby
	super_heros.map do |super_hero|
		puts "#{super_hero[:hero]} is #{super_hero[:secret_identity]}"
	end
```

```ruby
	super_heros.each do |super_hero|
		puts "#{super_hero[:hero]} is #{super_hero[:secret_identity]}"
	end
```

*	.each returns the original array.
*	Map returns a new array with the results you added.


###Tips, Tricks & Motivation


*	[Writing A REST Client in Ruby](http://www.alphadevx.com/a/88-Writing-a-REST-Client-in-Ruby)

*	[Use RestClient for HTTP requests in Ruby](https://coderwall.com/p/bmgapg)

*	[Understand Rest Client (Advanced)](http://www.ibm.com/developerworks/library/os-understand-rest-ruby/)

*	[JSON What It Is, How It Works and How To Use It](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/)
	*	The code in this article is JavaScript. Read the article to get a better understanding of what is JSON don't worry about the code.

__Map versus do__

*	[Difference Between Map And Each](http://stackoverflow.com/questions/9586989/difference-between-map-and-each)

*	[Video about Difference Between Map and Each](http://www.youtube.com/watch?v=jJHzwgPl5lA)


###Still Feel Lost?
####Catch Up With These Resources

Look at the resources from lesson 3 class.
