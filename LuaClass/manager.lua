require('class')

local Manager = Class("Manager")

local instance = nil
function Manager:GetInst()
	if instance == nil then
		instance = ClassList['Manager']:instance()
	end
	return instance
end

function Manager:Init()
	self.datas = {}
end

function Manager:GetSize()
	return #self.datas
end

function Manager:AddPerson(person)
	table.insert(self.datas, person)
end

function Manager:GetPerson(index)
	return self.datas[index]
end
