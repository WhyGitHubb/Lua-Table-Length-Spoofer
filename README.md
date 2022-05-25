# Lua-Array-Length-Spoofer or Lua-Table-Length-Spoofer

such wow

# usage

```
yourtable = {"your string",1,2,3}
print(#yourtable) -- your table length is 4
spoofTable(yourtable)
print(#yourtable) -- your table length is 0, such wow
```

# how it works

so u get a length of a table by doing
```
print(#{1,2,3,"4"}) -- prints 4
```
but it gets wonky when I do this
```
print(#{nil,nil,nil,nil,1,2,3,"4",nil}) -- prints 0
print(#{nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,2,3,"4",nil}) -- prints 0, you can put as much nil values as you want, as long as it is greater than or equal to the initial table length and has a nil value on the final index
print(#{nil,nil,nil,1,2,3,"4",nil}) -- prints 7 cuz the number of nil values is less than the initial table lenght
```
so obviously something isnt right here and for some reason it prints 0...

and so I abused this Lua **"feature"** to create a table length spoofer
```
local exampleTable = {"importantString",69,1,2,3}
local exampleTable1 = {1,2,3,4,5,6,7,8,9,0,nil,"a","e","i","o","u"}

print(#exampleTable) -- 5
print(#exampleTable1) -- 16

local function spoofTable(tbl)
    assert(type(tbl) == "table", "Pass me a table")
    local siz = #tbl
    if not siz or siz == 0 then return end
    for i = 1, siz do
        table.insert(tbl,1, nil)    
    end
    table.insert(tbl, nil)
    return tbl
end

spoofTable(exampleTable)
spoofTable(exampleTable1)

print(#exampleTable) -- 0
print(#exampleTable1) -- 0
```

I dont know where this would be used for or if this is even useful at all since you can always edit the __len metamethod and you can get the real length by using pairs(), but I thought this Lua **"feature"** was cool and decided to make something with it. 
