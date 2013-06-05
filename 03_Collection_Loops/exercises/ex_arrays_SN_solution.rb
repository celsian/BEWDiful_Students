categories = []

categories << "Aww"
categories.push("TodayILearned")
categories.unshift("WTF")

categories.uniq!

if categories.include?("Animals")
  categories << "Family"
end

puts categories.join(", ")

puts categories.shift
puts categories.pop

if categories.size > 5
  categories = []
end

# self.hug