require "rest-client"
require "json"
require "cgi"

def question(q)
	puts q
	CGI.escape(gets.chomp) #Need this because you cannot have spaces in a web address, CGI.escape fixes that.
end

origin = question("Where are you starting?")
destination = question("Where are you going?")
origin = CGI.escape("1444 Victoria Glen Escondido Ca 92025")
destination = CGI.escape("2711 Sunset Hills Escondido Ca 92025")

query = "origin=#{origin}&destination=#{destination}&sensor=false"
url = "http://maps.googleapis.com/maps/api/directions/json?#{query}"

response = RestClient.get(url)

directions = JSON.load(response) #All keys in JSON will be strings.
route = directions["routes"][0]
leg = route["legs"][0]

leg["steps"].each do |step|
	puts step["html_instructions"].gsub(/<\/?[^>]*>/,"")
end