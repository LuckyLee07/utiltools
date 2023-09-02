require('class')

local Person = Class("Person")
function Person:Init(name)
	self.age = 0
	self.name = name
end

function Person:GetAge()
	return self.age
end

function Person:Desc()
	print(self.name .. 'is person')
end