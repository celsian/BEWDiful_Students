#Class 5 Code Along

jimmy = {}
jimmy[:name] = "Jimmy Mcbordermier"
jimmy[:major] = "Math"
jimmy[:course] = "Dr. Dre"
jimmy[:grade] = "C"

robert = {}
robert[:name] = "Robert Ross"
robert[:major] = "CS"
robert[:course] = "Objects"
robert[:grade] = "A"

def grade_status(student)
	if student[:grade] == "F"
		"failed"
	elsif student[:grade] <= "D"
		"passed"
	end
end

puts grade_status(jimmy)

#Need to make our own object so we can run methods on it. object.passing? (ret t/f)
#Solution? Class & Objects (obviously)

class Student
	attr_accessor :name, :major, :course, :grade #This is a class method

	# def passing?
	# 	if grade == "F"
	# 		false
	# 	else
	# 		true
	# 	end
	# end

	def passing_status
		"#{name} is studying #{major} and he #{pass? ? "is" : "is not"} passing and #{cheater? ? "is" : "is not"} a cheater."
	end

	def cheater?
		if name == "Jeff"
			true
		else
			false
		end
	end
end

class Grade
	attr_accessor :grade

	def pass?
		if grade == "F"
			false
		else
			true
		end
	end
end

#Robert is the object.
robert = Student.new
robert.name = "Robert"
robert.major = "CS"
robert.course = "Robotics"
robert.grade = Grade.new
robert.grade.grade = "A"

puts robert.cheater?

puts robert.grade.pass?
#Fix this
# puts robert.passing_status
