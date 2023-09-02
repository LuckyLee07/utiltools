require('utils')
require('male')
require('female')
require('manager')
require('student')

--[[
local xman = ClassList.Male.new()
local fman = ClassList.Female.new()
print(xman, '\n')
print(fman, '\n\n')
print(xman.super, '\n')
print(fman.super, '\n\n')
print(getmetatable(xman), '\n')
print(getmetatable(fman), '\n\n')

GetInst('Manager'):AddPerson(xman)
GetInst('Manager'):AddPerson(fman)
print(GetInst('Manager'):GetPerson(1))
print('----------------------------')
--]]

local student = ClassList.Student.new()
print(student)
print(student.super)
print(getmetatable(student))

local xman = ClassList.Male.new('Lily')
local fman = ClassList.Female.new('Lucy')
xman:Desc()
fman:Desc()

local person = ClassList.Person.new('nil')
print(person, '\n', getmetatable(person))
