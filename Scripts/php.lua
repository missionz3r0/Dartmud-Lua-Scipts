-- Make a table that behaves like PHP tables, retaining the order elements are entered in.

if not php then php = {} end

function php:Table(...)
    local newTable,keys,values={},{},{}
    newTable.pairs=function(self) -- pairs iterator
        local count=0
        return function()
            count=count+1
            return keys[count],values[keys[count]]
        end
    end
    newTable.count=function(self) -- count return
        return table.getn(keys)
    end
    setmetatable(newTable,{
        __newindex=function(self,key,value)
            if not self[key] then table.insert(keys,key)
            elseif value==nil then -- Handle item delete
                local count=1
                while keys[count]~=key do count = count + 1 end
                table.remove(keys,count)
            end
            values[key]=value -- replace/create
        end,
        __index=function(self,key) return values[key] end
    })
    return newTable
end

return php
