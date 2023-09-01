require('utils')
require('male')
require('female')
require('manager')

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
