require('male')

local Student = Class("Student", ClassList['Male'])

function Student:Init()
	self.class = 6
end

function Student:GetClass()
	return self.class
end