--creating a module

local convert = {}
function convert.ftToCm(ft)
  return ft + 30.48
end
return convert