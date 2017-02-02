save = {}
local saveTable = {}

local function dmSave()
    table.save(getMudletHomeDir().."/dartmud.txt", saveTable)
end

local function dmLoad()
    if io.exists(getMudletHomeDir().."/dartmud.txt") then
        table.load(getMudletHomeDir().."/dartmud.txt", saveTable)
    end
end

local function add(source, tableToSave)
    saveTable[source] = tableToSave
    dmSave()
end

local function get(source)
    return saveTable[source]
end

local function remove(source)
    saveTable[source] = nil
    dmSave()
end

save = {
    dmSave = dmSave,
    dmLoad = dmLoad,
    add = add,
    get = get,
    remove = remove
}

return save
