require('person')

local Male = Class("Male", ClassList['Person'])
function Male:Init()
	self.age = 99
	self.sex = "male"
end

function Male:GetSex()
	return self.male
end

function Male:Desc()
	print(self.name .. ' is male')
end
