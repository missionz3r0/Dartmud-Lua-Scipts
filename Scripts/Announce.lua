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
  Announce.save()
end

local function announceVerbose(args)
  cecho("<yellow>Announce Verbose: Skill_Name +\n")
  isAnnounce = true
  isVerbose = true
  Announce.save()
end

local function announceOff(args)
  cecho("<yellow>Announce off\n")
  isAnnounce = false
  Announce.save()
end

local function loaderFunction(sentTable)
  if sentTable then
    isAnnounce = sentTable[isAnnounce]
    isVerbose = sentTable[isVerbose]
  end
end

local function load()
  Events.raiseEvent("loadEvent",{sourceName = sourceName, functionToSendData = loaderFunction})
end

local function save()
  Events.raiseEvent("saveEvent",
                    {
                      sourceName = sourceName
                      ,tableToSave = {
                        isAnnounce = isAnnounce or false
                        ,isVerbose = isVerbose or false
                      }
                    })
end

local function setup(args)
  Events.addListener("skillImproveEvent",sourceName,announce)
  Events.addListener("announceOnEvent",sourceName,announceOn)
  Events.addListener("announceVerboseEvent",sourceName,announceVerbose)
  Events.addListener("announceOffEvent",sourceName,announceOff)
end

local function unsetup(args)
  Events.removeListener("skillImproveEvent",sourceName,announce)
  Events.removeListener("announceOnEvent",sourceName)
  Events.removeListener("announceVerboseEvent",sourceName)
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
  ,save = save
}

return Announce
