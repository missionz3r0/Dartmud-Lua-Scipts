Status = {}

local sourceName = "status"

Status.age = ''
Status.alignment = ''
Status.aura = ''
Status.encumberance = ''
Status.hunger = ''
Status.movement = ''
Status.name = ''
Status.race = ''
Status.thirst = ''
Status.youth = ''

local function setAge(age)
  Status.age = age
end

local function setAlignment(alignment)
  Status.alignment = alignment
end

local function setAura(aura)
  Status.aura = aura
end

local function setEncumberance(encumberance)
  Status.encumberance = encumberance
end

local function setHunger(hunger)
  Status.hunger = hunger
end

local function setMovement(movement)
  Status.movement = movement
end

local function setName(name)
  Status.name = name
end

local function setRace(race)
  Status.race = race
end

local function setThirst(thirst)
  Status.thirst = thirst
end

local function setYouth(youth)
  Status.youth = youth
end

local function save()
  local saveTable = {}

  saveTable["age"] = Status.age
  saveTable["alignment"] = Status.alignment
  saveTable["aura"] = Status.aura
  saveTable["encumberance"] = Status.encumberance
  saveTable["hunger"] = Status.hunger
  saveTable["movement"] = Status.movement
  saveTable["name"] = Status.name
  saveTable["race"] = Status.race
  saveTable["thirst"] = Status.thirst
  saveTable["youth"] = Status.youth

  return saveTable
end

function Status.load()
  Handlers.addageEventListener(sourceName, setAge)
  Handlers.addalignmentListener(sourceName, setAlignment)
  Handlers.addauraEventListener(sourceName, setAura)
  Handlers.addencumbranceEventListener(sourceName, setEncumberance)
  Handlers.addhungerEventListener(sourceName, setHunger)
  Handlers.addmovementEventListener(sourceName, setMovement)
  Handlers.addnameEventListener(sourceName, setName)
  Handlers.addraceEventListener(sourceName, setRace)
  Handlers.addthirstEventListener(sourceName, setThirst)
  Handlers.addyouthfullnessEventListener(sourceName, setYouth)

  Handlers.addsaveEventListener(sourceName, save)
end

function Status.unload()
  Handlers.removeageEventListener(sourceName)
  Handlers.removealignmentListener(sourceName)
  Handlers.removeauraEventListener(sourceName)
  Handlers.removeencumbranceEventListener(sourceName)
  Handlers.removehungerEventListener(sourceName)
  Handlers.removemovementEventListener(sourceName)
  Handlers.removenameEventListener(sourceName)
  Handlers.removeraceEventListener(sourceName)
  Handlers.removethirstEventListener(sourceName)
  Handlers.removeyouthfullnessEventListener(sourceName)

  Handlers.removesaveEventListener(sourceName)
end

function Status.reload()
  unload()
  load()
end

return Status
