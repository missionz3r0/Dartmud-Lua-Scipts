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
Status.soulage = ''
Status.thirst = ''

local function setAge(soulAge)
  Status.soulage = soulAge
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

local function setAge(age)
  Status.age = age
end

function Status.load()
  Handlers.addAgeListener(sourceName, setAge)
  Handlers.addAlignmentListener(sourceName, setAlignment)
  Handlers.addAuraListener(sourceName, setAura)
  Handlers.addEncumbranceListener(sourceName, setEncumberance)
  Handlers.addHungerListener(sourceName, setHunger)
  Handlers.addMovementListener(sourceName, setMovement)
  Handlers.addNameListener(sourceName, setName)
  Handlers.addRaceListener(sourceName, setRace)
  Handlers.addSoulAgeListener(sourceName, setSoulAge)
  Handlers.addThirstListener(sourceName, setThirst)


end

function Status.unload()
  Handlers.removeAgeListener(sourceName)
  Handlers.removeAlignmentListener(sourceName)
  Handlers.removeAuraListener(sourceName)
  Handlers.removeEncumbranceListener(sourceName)
  Handlers.removeHungerListener(sourceName)
  Handlers.removeMovementListener(sourceName)
  Handlers.removeNameListener(sourceName)
  Handlers.removeRaceListener(sourceName)
  Handlers.removeSoulAgeListener(sourceName)
  Handlers.removeThirstListener(sourceName)
end

function Status.reload()
  Status.unload()
  Status.load()
end

return Status
