Events = {}

local eventList = {}

--I really want to get rid of these anonymous event handlers, but I've no idea
--as to how for the moment. So I'll settle with a clunky push into the eventlist
local function setup(args)
  registerAnonymousEventHandler("sysWindowResizeEvent", "Events.raiseWindowResizeEvent")
  registerAnonymousEventHandler("sysDownloadDone", "Events.raiseSysDownloadDoneEvent")
  registerAnonymousEventHandler("sysDownloadError", "Events.raiseSysDownloadErrorEvent")
  registerAnonymousEventHandler("sysDataSendRequest","Events.raiseSysDataSendRequestEvent")
end

local function unsetup(args)
  eventList = {}
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

local function createEventList(eventName)
  if(not eventList[eventName]) then
    eventList[eventName] = {}
  end
end

local function raiseWindowResizeEvent(evt, x, y)
  args = {x = x, y = y}
  Events.raiseEvent("sysWindowResizeEvent", args)
end

local function raiseSysDownloadDoneEvent(evt, file)
  args = {file = file}
  Events.raiseEvent("sysDownloadDoneEvent", args)
end

local function raiseSysDownloadErrorEvent(evt, error, url)
  args = {error = error, url = url}
  Events.raiseEvent("sysDownloadErrorEvent", args)
end

local function raiseSysDataSendRequestEvent(evt, command)
  args = {command = command}
  Events.raiseEvent("sysDataSendRequestEvent", args)
end

local function raiseEvent(eventName, args)
  createEventList(eventName)

  for k,v in pairs(eventList[eventName]) do
    v(args)
  end
end

local function addListener(eventName, sourceName, listenerFunction)
  createEventList(eventName)

  eventList[eventName][sourceName] = listenerFunction
end

local function removeListener(eventName, sourceName)
  createEventList(eventName)

  eventList[eventName][sourceName] = function(args) end
end

Events = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,raiseEvent = raiseEvent
  ,raiseWindowResizeEvent = raiseWindowResizeEvent
  ,raiseSysDownloadErrorEvent = raiseSysDownloadErrorEvent
  ,raiseSysDownloadDoneEvent = raiseSysDownloadDoneEvent
  ,raiseSysDataSendRequestEvent = raiseSysDataSendRequestEvent
  ,addListener = addListener
  ,removeListener = removeListener
}

return Events
