require('class')

local Person = Class("Person")
function Person:Init()
	self.age = 0
	self.name = "P"
end

function Person:GetAge()
	return self.age
end
