local Inscribing = {}

sourceName = "inscribing"

local practiceWriteMemory = {}

local function inscribe()
end

local function inscribeSetup(args)
  local spell = args["spell"]
  local power = args["power"]
end

local function load(args)
end

local function setup(args)
  Events.addListener("practiceInscribingEvent", sourceName, inscribeSetup)
end

local function unsetup(args)
  Events.removeListener("practiceInscribingEvent", sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

local function load()
  Events.raiseEvent("loadEvent",sourceName,
                   function(sentTable)
                     practiceWriteMemory = sentTable
                   end)
end

local function save()
  Events.raiseEvent("saveEvent",sourceName, practiceWriteMemory)
end

Inscribing = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
}

return Inscribing
