require('person')

local Female = Class("Female", ClassList['Person'])
function Female:Init()
	self.age = 99
	self.sex = "female"
end

function Female:GetSex()
	return self.male
end

function Female:Desc()
	print(self.name .. ' is female')
end