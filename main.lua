-- this is a comment
--[[this is a 
multiline
comment]]

--inequality is ~=
--use and/or instead of &&/||
--use not to invert values
--1 indexed language
--uses 'tables' instead of arrays, objects, dictionaries, tuples, etc.
--use # for count/size

--control: no continue statement, we have break though

--dynamic types (number string bool nil)

--this won't be true random, it will always be the *same* 'random' number
-- secretNumber = math.random(100)

--using math.randomseed(os.time()) before math.random will assure different values each time we run!
math.randomseed(os.time())

--user input:
print("What's your name?")
name = io.read()
print("Welcome, "..name.."!\n")

local variableDeclaredLikeThis = 8
local y = "why"
z = 'code'

print(y)
print('not')

if true then print('learn') end
if false then print ('sleep') end

print([[how
to
write]])

print('lua' .. ' ' .. z .. '\n')

con = 'concatenate'

io.write('you can also use "io.write" instead of "print"\n')
--use string.upper and string.lower
--use string.gsub(string, replaceThis, withThis)
exampleString = 'Auhbz is the best!'
print(string.gsub(exampleString,'Auhbz','Carven')..'\n')

quote = 'I have a very cool girlfriend'
print(quote)
print("Index of I: "..string.find(quote, "I"))
print("Index of cool: "..string.find(quote, "cool"))
print("Index of first a: "..string.find(quote, "a")..'\n')

--functions (must be defined prior to call)
globalVariable = 'somethingElse'

function printSomething(s)
  local localVariable = 'anotherThing'
  print(s)
end

printSomething('something')
if not type(globalVariable) == nil
then print('globalVariable: '..globalVariable)
end

if not type(localVariable) == nil 
then print('localVariable: '.. localVariable)
end

--veradic functions (receiving unknown number of params)
function getSumVeradic(...)
  local sum = 0
  for k,v in pairs{...} do
    sum = sum + v
  end
  return sum
end

print('\ngetSumVeradic(10,6): '..getSumVeradic(10,6))
print('getSumVeradic(9,1,2,4): '..getSumVeradic(9,1,2,4)..'\n')

--can store functions in variable names and tables
--can pass functions to functions
doubler = function(x) return x*2 end
print("doubler(6): "..doubler(6))

--closure is a function that can access local functions of an encolsing function
function outerFunction()
  local i = 0
  return function()
    i = i + 1
    return i
  end
end

getI = outerFunction()

print("First call to getI(): "..getI())
print("Second call to getI(): "..getI()..'\n')
--so the closure stores values as it's called multiple times

--coroutines: similar to 'threads' but dont run in parallel
--can have status: running, suspended, dead, normal
co = coroutine.create(function()
  for i = 1, 10, 1 do
    print('co i: '..i)
    print('status: '..coroutine.status(co))
    if i == 5 then coroutine.yield() end
  end
end)

print('\ncoroutine.status(co): '..coroutine.status(co))
print('executing coroutine.resume(co)...')
coroutine.resume(co)
print('after coroutine.resume(co): ')
print('coroutine.status(co): '..coroutine.status(co))

--creating another coroutine to run at the same time:
co2 = coroutine.create(function()
  for i = 101, 110, 1 do
    print("co2 i: "..i)
  end
end)

coroutine.resume(co2)
coroutine.resume(co)

print('coroutine.status(co): '..coroutine.status(co)..'\n')

--loops
seven = 7
while seven > 0 do
  print(seven)
  seven = seven - 1
end

repeat
  print("remember your name? Enter it: ")
  response = io.read()
until response == name

--for loops written like this will default to incrementing by 1 each iteration
print('\nfor loops:')
for i = 0, 5 do
  print(i)
end

print('\n')
for i = 5, 0, -1 do
  print(i)
end

print('\n')

--tables -> similar to arrays/objects
--can have tables within tables
--can have mixed data types
colors = {'red', 'yellow', 'orange'}
print(colors[2])

--table.insert(toTable, atIndex, whatToInsert)
print('size of colors table: '..#colors)
table.insert(colors, 'green')
print('size of colors table: '..#colors)

table.insert(colors, 1, 'purple')
print('\ncontent of colors table:')
for i=1, #colors do
  print(colors[i])
end

table.remove(colors, #colors)
print('\ncontent of colors table:')
for i=1, #colors do
  print(colors[i])
end
print('\n')
people = {
  {'auhbz', 26},
  {'carven', 24}
}

for a=1, #people do
  print(people[a][1] .. " is " .. people[a][2] .. " years old")
end

--key tables: note you can't use # to get size/count, must iterate!
scores = {
  ['auhbz'] = 137,
  ['carven'] = 19
}

print("\nauhbz's score: "..scores['auhbz']..'\ncarven\'s score: '..scores['carven'])

----updating/inserting/removing
scores['auhbz'] = 0
scores['fiona'] = 7

print ("\nauhbz's score: "..scores['auhbz'].."\ncarven's score: "..scores['carven'].."\nfiona's score: "..scores['fiona']..'\n')

--by key, set value to nil to 'remove it'
table['auhbz'] = nil

--iterating through tables!!
daysOfWeek = {'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'}
for numberOfDay, nameOfDay in pairs(daysOfWeek) do
  print(nameOfDay.."is day "..numberOfDay.." of the week!")
end

newScores = {
  ['auhbz'] = 137,
  ['carven'] = 19,
  ['fiona'] = 7,
  ['nati'] = 21
}
print('\n')
for key, value in pairs(newScores) do
  print(key.." has a score of: "..value)
end

--convert table to string: table.concat(tableName, "separateItemsBy")
numberTable = {1,1}
for i = 3, 12, 1 do
  local value = numberTable[i-1] + numberTable[i-2]
  table.insert(numberTable,value)
end
print('\nMy number table: '..table.concat(numberTable,", "))

--numbers
number = -10
decimal = 1.3
print('\nnumber: '..number..'\nmath.abs(number): '..math.abs(number))
print('math.pi: '..math.pi)
print('math.deg(math.pi): '..math.deg(math.pi))
print('math.rad(180): '..math.rad(180))
print('math.pi: '..math.pi)
print('decimal: '..decimal..'\nmath.ceil(decimal): '..math.ceil(decimal)..'\nmath.floor(decimal): '..math.floor(decimal))
print('math.random(): '..math.random())
print('math.random(100) gives random number between 1 and 100: '..math.random(100))
print('math.random(50,100) gives random number between 50 and 100: '..math.random(50, 100))

secretNumber = math.random(100)

print('\nguess my number! (between 1 and 100)')
repeat
  guess = tonumber(io.read())
  if guess > secretNumber then print('your guess was too high!') end
  if guess < secretNumber then print('your guess was too low!') end
until guess == secretNumber
print("You got it!")

--more stuff
--can also use string.format() with %d and %s to insert variables into strings
function getSum(n,m)
  return n + m
end
x = 4
y = 2
print('sum of '.. x .. ' and '.. y .. ': '.. getSum(x,y)..'\n')

function splitString(string)
  stringTable = {}
  local i = 1
  for word in string.gmatch(string, "[^%s]+") do --some regex
    stringTable[i] = word
    i = i + 1
  end

  return stringTable, i-1
end

someString = "The fox jumped lorem the ipsum"
print(someString)

returnedTable, returnedNumber = splitString(someString)

print("There are "..returnedNumber.. " words in the string:")
for i = 1, returnedNumber, 1 do
  print(i..': '..returnedTable[i])
end

----file io
-- r: read only
-- w: overwrite or create new file
-- a: append or create a new file
-- r+: read and write existing file
-- w+: overwrite read or create a file
-- a+: append read or create a file

file = io.open('text.lua', 'w+') --file created!
file:write("Random String of text in our new file\n")
file:write("Adding more text to our file!\n")

file:seek('set',0) --to read from file, jump back to the beginning of it
print(file:read('*a')) -- *a meaning 'everying'

file:close()

--lets append some data to the end of our file
file = io.open('text.lua', 'a+')
file:write('Even more text!!!\n')
file:seek('set',0)
print(file:read('*a'))
file:close()

--modules (see convert.lua file)
convertModule = require('convert')
print("5 feet is approx "..convertModule.ftToCm(5).." centimeters")

--metatable: defines how operations on tables should be carried out
--adding, subtracting, multiplying, dividing, concatenating, comparing, combining(..) etc.

myTable = {}
for x = 1, 10 do
  myTable[x] = x
end

metaTable = {
  __add = function(table1, table2)
  sumTable = {}
  for y = 1, #table1, 1 do 
    if (table1[y] ~= nil) and (table2[y] ~= nil) then
      sumTable[y] = table1[y] + table2[y]
    else
      sumTable[y] = 0
    end
  end
  return sumTable
end,
  __eq = function(table1, table2)
    return table1.value == table2.value
  end
}

setmetatable(myTable, metaTable) -- attach the rules to the table

myAssignedCopyTable = myTable
myValueCopyTable = {}
for i = 1, #myTable do
  myValueCopyTable[i] = myTable[i]
  -- print(string.format('myTable[%d]: %s',i,myTable[i]))
  -- print(string.format('myValueCopyTable[%d]: %s',i,myValueCopyTable[i]))
end
print("\nChecking table equality:")
print("myTable == myTable:")
print(myTable == myTable)
print("myAssignedCopyTable == myTable:")
print(myAssignedCopyTable == myTable)
print("myValueCopyTable == myTable:")
print(myValueCopyTable == myTable)

anotherTable = {}
print("\nAdding tables:")
anotherTable = myTable + myTable
for z = 1, #anotherTable do
  print(anotherTable[z])
end
print('\n')

-- pseudo oop: ok so lua isn't an oopl but we can kind of fake it, and heres how
Animal = {height = 0, weight = 0, name = "None", sound = "None"}
function Animal:new (height, weight, name, sound)
  newAnimal = setmetatable({}, {__index = self})
  newAnimal.height = height
  newAnimal.weight = weight
  newAnimal.name = name
  newAnimal.sound = sound

  return newAnimal
end

function Animal:toString()
  local animalString = string.format('%s weighs %.1f lbs, is %.1f inches tall and says %s', self.name, self.weight, self.height, self.sound)
  return animalString
end

yoshi = Animal:new(10,15,"Yoshi","Bjork")
print("Yoshi's weight: "..yoshi.weight)
print("Printing Yoshi object: "..yoshi:toString())

appa = Animal:new(7,11,"Appa","Ruff")
print("\nAppa's weight: "..appa.weight)
print("Printing Appa object: "..appa:toString())

print("\nPrinting Yoshi object: "..yoshi:toString())


--inheritance works too:
Cat = Animal:new() --now Cat object has all the functions of animal

--we can override any of the inherited functions/attributes
function Cat:toString()
  catString = string.format('%s weighs %.1f lbs, is %.1f inches tall and says %s and is a cat!!', self.name, self.weight, self.height, self.sound)
  return catString
end

print('\n')
garfield = Cat:new(20,15,"Garfield","I hate Mondays","Lasagna")
print("garfield print: "..garfield:toString())