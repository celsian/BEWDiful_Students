require "rest-client"
require "json"
require "cgi"

def question(q)
<<<<<<< HEAD
	puts q
	CGI.escape(gets.chomp) #Need this because you cannot have spaces in a web address, CGI.escape fixes that.
=======
  puts q
  CGI.escape(gets.chomp)
>>>>>>> upstream/master
end

origin = question("Where are you starting?")
destination = question("Where are you going?")
<<<<<<< HEAD

=======
>>>>>>> upstream/master
query = "origin=#{origin}&destination=#{destination}&sensor=false"
url = "http://maps.googleapis.com/maps/api/directions/json?#{query}"

response = RestClient.get(url)
<<<<<<< HEAD

directions = JSON.load(response) #All keys in JSON will be strings.
=======
directions = JSON.load(response)
>>>>>>> upstream/master
route = directions["routes"][0]
leg = route["legs"][0]

leg["steps"].each do |step|
<<<<<<< HEAD
	puts step["html_instructions"].gsub(/<\/?[^>]*>/,"")
end
=======
  puts step["html_instructions"].gsub(/<\/?[^>]*>/,"")
end
>>>>>>> upstream/master
