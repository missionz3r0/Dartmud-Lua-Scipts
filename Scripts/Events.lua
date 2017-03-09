Events = {}

local eventlist = {}

--I really want to get rid of these anonymous event handlers, but I've no idea
--as to how for the moment. So I'll settle with a clunky push into the eventlist
local function load(args)
  local isFirstLoad = args["isFirstLoad"]
  if(isFirstLoad) then
    registerAnonymousEventHandler("sysWindowResizeEvent", "Events.raiseWindowResizeEvent")
    registerAnonymousEventHandler("sysDownloadDone", "Events.raiseSysDownloadDoneEvent")
    registerAnonymousEventHandler("sysDownloadError", "Events.raiseSysDownloadErrorEvent")
  end
end

local function unload(args)
end

local function reload(args)
  load(args)
  unload(args)
end

local function createEventList(eventName)
  if(not eventList[eventName]) then
    eventList[eventName] = {}
  end
end

local function raiseWindowResizeEvent(evt, x, y)
  args = {x = x, y = y}
  Events.raiseEvent("windowResizeEvent", args)
end

local function raiseSysDownloadDoneEvent(evt, file)
  args = {file = file}
  Events.raiseEvent("sysDownloadDoneEvent", args)
end

local function raiseSysDownloadErrorEvent(evt, error, url)
  args = {error = error, url = url}
  Events.raiseEvent("sysDownloadErrorEvent", args)
end

local function raiseEvent(eventName, args)
  createEventList(eventName)

  for k,v in pairs(EventList[eventName]) do
    v(args)
  end
end

local function addListener(eventName, sourceName, listenerFunction)
  createEventList(eventName)

  EventList[eventName][sourceName] = listenerFunction
end

local function removeListener(eventName, sourceName)
  createEventList(eventName)

  EventList[eventName][sourceName] = nil
end

Events = {
  load = load
  ,unload = unload
  ,reload = reload
  ,raiseEvent = raiseEvent
  ,raiseWindowResizeEvent = raiseWindowResizeEvent
  ,raiseSysDownloadErrorEvent = raiseSysDownloadErrorEvent
  ,raiseSysDownloadDoneEvent = raiseSysDownloadDoneEvent
  ,addListener = addListener
  ,removeListener = removeListener
}

return Events
