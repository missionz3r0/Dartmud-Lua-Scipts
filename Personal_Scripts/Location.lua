local Location = {}

local sourceName = "location"

aliases = {}
triggers = {}

local function setup(args)
  tempAliases = {}

  aliases = tempAliases
end

local function unsetup(args)

  for i,v in pairs(aliases) do
    killAlias(v)
  end
  aliases = {}

  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Location = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Location
