local Announce = {}

local sourceName = "announce"
local isAnnounce = false
local isVerbose = false

local function announce(args)
  local skill_name = args["skill_name"]
  if(isAnnounce) then
    if(isVerbose) then
      send("ooc "..skill_name.." +")
    else
      send("ooc +")
    end
  end
end

local function announceOn(args)
  cecho("<yellow>Announce on: +\n")
  isAnnounce = true
  isVerbose = false
  save()
end

local function announceVerbose(args)
  cecho("<yellow>Announce Verbose on: Skill_Name +\n")
  isAnnounce = true
  isVerbose = true
  save()
end

local function announceOff(args)
  cecho("<yellow>Announce off\n")
  isAnnounce = false
  save()
end

local function load()
  Events.raiseEvent("loadEvent",sourceName,
                   function(sentTable)
                     isAnnounce = sentTable[isAnnounce]
                     isVerbose = sentTable[isVerbose]
                   end)
end

local function save()
  Events.raiseEvent("saveEvent",sourceName,
                    {
                      isAnnounce = isAnnounce
                      ,isVerbose = isVerbose
                    })
end

local function setup(args)
  Events.addListener("skillImproveEvent",sourceName,announce)
  Events.addListener("announceOnEvent",sourceName,announceOn)
  Events.addListener("announceVervoseEvent",sourceName,announceVerbose)
  Events.addListener("announceOffEvent",sourceName,announceOff)
end

local function unsetup(args)
  Events.removeListener("skillImproveEvent",sourceName,announce)
  Events.removeListener("announceOnEvent",sourceName)
  Events.removeListener("announceVervoseEvent",sourceName)
  Events.removeListener("announceOffEvent",sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Announce = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
}

return Announce
