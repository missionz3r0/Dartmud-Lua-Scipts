local Announce = {}

local sourceName = "announce"
local isAnnounceOn = false
local isAnnounceVerbose = false

local function announce(args)
  local skill_name = args["skill_name"]
  if(isAnnounceOn) then
    if(isAnnounceVerbose) then
      send("ooc "..skill_name.." +")
    else
      send("ooc +")
    end
  end
end

local function announceOn(args)
  isAnnounceOn = true
  isAnnounceVerbose = false
end

local function announceVerbose(args)
  isAnnounceOn = true
  isAnnounceVerbose = true
end

local function announceOff(args)
  isAnnounceOn = false
end



local function load(args)
  Events.addListener("skillImproveEvent",sourceName,announce)
  Events.addListener("announceOnEvent",sourceName,announceOn)
  Events.addListener("announceVervoseEvent",sourceName,announceVerbose)
  Events.addListener("announceOffEvent",sourceName,announceOff)
end

local function unload(args)
  Events.removeListener("skillImproveEvent",sourceName,announce)
  Events.removeListener("announceOnEvent",sourceName)
  Events.removeListener("announceVervoseEvent",sourceName)
  Events.removeListener("announceOffEvent",sourceName)
end

local function reload(args)
  unload(args)
  load(args)
end

Announce = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Announce
