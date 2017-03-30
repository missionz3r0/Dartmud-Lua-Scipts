local Saver = {}

local sourceName = "save"

local saveTable = {}

local function saveFile(args)
  local sourceNameArg = args["sourceName"]
  local tableToSave = args["tableToSave"]
  saveTable[sourceNameArg] = tableToSave
  table.save(getMudletHomeDir().."/dartmudlet.txt", saveTable)
end

local function sendData(args)
  local sourceNameArg = args["sourceName"]
  local functionToSendData = args["functionToSendData"]
  functionToSendData(saveTable[sourceNameArg])
end

local function setup(args)
  if io.exists(getMudletHomeDir().."/dartmudlet.txt") then
    table.load(getMudletHomeDir().."/dartmudlet.txt", saveTable)
  else
    saveTable = {}
    table.save(getMudletHomeDir().."/dartmudlet.txt", saveTable)
  end

  Events.addListener("saveEvent", sourceName, saveFile)
  Events.addListener("loadEvent", sourceName, sendData)
end

local function unsetup(args)
  Events.removeListener("saveEvent", sourceName)
  Events.removeListener("loadEvent", sourceName)
  table.save(getMudletHomeDir().."/dartmudlet.txt", saveTable)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Save = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Save
